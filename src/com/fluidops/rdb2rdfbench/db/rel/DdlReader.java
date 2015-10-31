package com.fluidops.rdb2rdfbench.db.rel;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.model.OWLOntologyStorageException;

import com.fluidops.rdb2rdfbench.util.OntoUtil;

/**
 * Implements a quick DDL scanner extracting the relevant aspects for building a
 * schema graph. Does not implement a full parser but assumes typical
 * serialization (as known from PostgreSQL) including certain white space.
 * 
 * @author cp, as
 */
public class DdlReader {
	/**
	 * Constructor.
	 * 
	 * @param path
	 *            Path to the DDL file to load.
	 * @param modelForeignKeys
	 *            Whether or not FOREIGN KEY relations should be modeled in the
	 *            graph where available.
	 * @param selfReferences
	 *            Determines if and how tables will include a "ref" link back to
	 *            themselves. Self reference edges will be added as optional
	 *            edges (see
	 *            {@link SchemaGraphManager#createOptionalHoldBackEdge(SchemaNode, de.dhbw.incmap.graphs.schemagraph.SchemaEdgeLabel, SchemaNode)}
	 *            for details) and need to be applied before they appear in the
	 *            graph.
	 */
	private SQLSchema schema;
	
	public DdlReader(String path, String schemaName) {
		
		schema = new SQLSchema(schemaName);

		try {
			load(path);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("Error opening or reading DDL file.");
		}
	}
	
	private enum DdlScanMode {
		SCAN, CREATE, CREATE_LNE, ALTER, FOREIGN_KEY, IGNORE
	}
	
	public SQLSchema getSQLSchema(){
		return schema;
	}

	private void load(String path) throws IOException {
		
		BufferedReader reader = new BufferedReader(new FileReader(path));
		DdlScanMode mode = DdlScanMode.SCAN; // basic parser state
		String param = ""; // parser state parameter
		boolean resetMode = false;
		SQLTable table = null; // currently active table
		LinkedList<String> tokens = new LinkedList<String>(); // current tokens
		List<String> referringAttributes = new ArrayList<>();
		
		while (tokens != null) {
			String next = tokens.isEmpty() ? "" : tokens.removeFirst();

			if (next.startsWith("--")) {
				tokens = new LinkedList<String>();
				next = "";
			} else if (next.endsWith(";")) {
				resetMode = true;
				next = next.substring(0, next.length() - 1);
			}

			next = next.replace("`", "");

			if (mode == DdlScanMode.SCAN) {
				if (next.equalsIgnoreCase("create") && tokens.get(0).equalsIgnoreCase("table")) {
					tokens.removeFirst();
					mode = DdlScanMode.CREATE;
					table = new SQLTable(schema,tokens.removeFirst());
					schema.put(table.getName(), table);
				} else if (next.equalsIgnoreCase("alter")
						&& tokens.get(0).equalsIgnoreCase("table")) {
					tokens.removeFirst();
					mode = DdlScanMode.ALTER;
					String tableName = tokens.removeFirst();

					if (tableName.equalsIgnoreCase("only"))
						tableName = tokens.removeFirst();
					if (tableName.contains("."))
						tableName = (tableName.split("\\."))[1];

					table = schema.get(SQLTable.sanitizeString(tableName));
					if (table == null)
						mode = DdlScanMode.SCAN; // ignore
				}
			} else if (mode == DdlScanMode.CREATE) {
				if (next.equalsIgnoreCase("primary") && tokens.get(0).equalsIgnoreCase("key"))
					mode = DdlScanMode.CREATE_LNE;
				else if(next.equalsIgnoreCase("constraint")){
					mode = DdlScanMode.CREATE_LNE;
				}
				else if (!next.equalsIgnoreCase("")){
					StringBuffer sb = new StringBuffer();
					
					while(!tokens.isEmpty()){
						String act = tokens.removeFirst(); 
						sb.append(act);
						if(act.endsWith(","))
							break;
					}
					
					table.addAttribute(next,sb.toString());
					mode = DdlScanMode.CREATE;
				}
			} else if (mode == DdlScanMode.CREATE_LNE) {
				if (next.contains(","))
					mode = DdlScanMode.CREATE; // proceed
			} else if (mode == DdlScanMode.ALTER) {
				if (next.equalsIgnoreCase("foreign") && tokens.get(0).equalsIgnoreCase("key")) {
					tokens.removeFirst();
					
					while(!tokens.get(0).equalsIgnoreCase("references"))
						referringAttributes.add(tokens.removeFirst());

//					param = tokens.removeFirst();
					mode = DdlScanMode.FOREIGN_KEY;
				} else if (next.equalsIgnoreCase("primary")
						&& tokens.get(0).equalsIgnoreCase("key")) {
					tokens.removeFirst();
					List<String> attrs = new ArrayList<>();
					while(!tokens.get(0).equalsIgnoreCase(";"))
						attrs.add(tokens.removeFirst());
					table.addPKAttributes(attrs);
					mode = DdlScanMode.ALTER;
				}
			} else if (mode == DdlScanMode.FOREIGN_KEY) {
				if (next.equalsIgnoreCase("references")) {
					String refTableName = tokens.removeFirst();
					SQLTable refTable = schema.get(SQLTable.sanitizeString(refTableName));
					List<String> referredAttributes = new ArrayList<>();
					while(!tokens.get(0).equalsIgnoreCase("on") && !tokens.get(0).equalsIgnoreCase(";"))
						referredAttributes.add(tokens.removeFirst());

//					table.addFKAttribute(tokens.removeFirst(), refTable);
					
					table.addFK(referringAttributes, refTable, referredAttributes);
					referringAttributes.clear();
				}
				mode = DdlScanMode.ALTER; // proceed
			}

			if (tokens.isEmpty()) {
				String line = reader.readLine();
				if (line != null) {
//					line = line.trim().toLowerCase();
					line = line.trim();
					tokens = new LinkedList<String>();

					for (String token : java.util.Arrays.asList(line
							.split(" |\\(|\\)"))) {
						token = token.trim();
						if (!token.equals(""))
							tokens.add(token);
					}
				} else
					tokens = null;
			}

			if (resetMode) {
				mode = DdlScanMode.SCAN;
				resetMode = false;
			}
		}

		reader.close();
	}
	
	public static void main(String [] args){
		
		boolean convertOnto = false;
		
		String [] folders = {"cmt_mixed","cmt_denormalized",
				"conference_naive","conference_naive_ci","sigkdd_mixed",
				"cmt_naive","conference_nofks","sigkdd_naive",
				"cmt_naive_ci","conference_renamed","sigkdd_naive_ci",
				"cmt_renamed","conference_structured","sigkdd_renamed",
				"cmt_structured","conference_structured_ci","sigkdd_structured",
				"cmt_structured_ci","sigkdd_structured_ci","conference_mixed",
		"sigkdd2conference","cmt2conference","cmt2sigkdd",
		"conference2cmt","conference2sigkdd","npd_atomic_tests",
				"npd_user_tests","sigkdd2cmt","sigkdd2conference"
		};

//		String [] folders = {
//				"cmt_denormalized",
//				"conference_naive",
//				"cmt_naive",
//				"conference_nofks",
//				"sigkdd_naive",
//				"conference_structured",
//				"cmt_structured",
//				"sigkdd_structured",
//		};
		
		OWLOntologyManager manager = OntoUtil.getManager(false);
		
		for (String folder : folders){
			
			String prefixPath = "data/" + folder + "/";
			DdlReader reader = new DdlReader(prefixPath + "dump.sql", folder);
			System.out.println(folder + " -> " + reader.getSQLSchema());
			if(convertOnto){
				try {
					String originalOntoPath = prefixPath + "ontology." + 
							(folder.equals("mondial") ? "n3" : "ttl");
					OWLOntology o = OntoUtil.load(originalOntoPath, true, manager);
					
					if(folder.equals("mondial"))
						System.out.println("");
					
					OntoUtil.saveAsOWLXML(o, prefixPath + "ontology.owl", manager);
					System.out.println("Ontology " + folder + " converted in OWL/XML");
					OntoUtil.unloadAllOntologies();
					System.out.print("Reading the OWL/XML ontology...");
					o = OntoUtil.load(prefixPath + "ontology.owl",true,manager);
					System.out.println(" done!");
				} catch (IllegalArgumentException | OWLOntologyCreationException | OWLOntologyStorageException | IOException e) {
					e.printStackTrace();
				} finally {
					OntoUtil.unloadAllOntologies();
				}
			}
		}
	}
}
