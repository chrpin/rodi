package com.fluidops.rdb2rdfbench.util;

import java.io.File;
import java.io.IOException;

import org.openrdf.repository.RepositoryException;

import com.fluidops.rdb2rdfbench.Config;
import com.fluidops.rdb2rdfbench.db.rdf.SesameAdapter;
import com.fluidops.rdb2rdfbench.db.rdf.SesameAdapter.RepoType;
import com.fluidops.rdb2rdfbench.db.rel.RdbmsUtil;

public class SetupUtil {

	/**
	 * Prepares a scenario for evaluation, i.e., loads both relational data and
	 * initial ontology.
	 * 
	 * @param scenario
	 *            Scenario ID.
	 */
	public static void setupScenario(String scenario) throws IOException,
			InterruptedException, RepositoryException {
		// wiping mappings from previous setup
		System.out.println("Cleaning possible mappings from previous scenarios...");
		
		File r2rmlDir = new File(Config.getInstance().getR2RmlPath());
		for (File file : r2rmlDir.listFiles())
			file.delete();
		
		// SQL
		System.out.println("Loading SQL dump into database...");

		if (Config.getInstance().getSelectDbms().equals("mysql")) {
			System.out.println("RDBMS changed to MySQL.");
			RdbmsUtil.loadMySQLDump("./data/" + scenario + "/dump.sql");
		} else {
			System.out.println("RDBMS set to default (PostgreSQL).");
			RdbmsUtil.loadPostgresDump("./data/" + scenario + "/dump.sql");
		}
		System.out.println("done.");

		System.out.println("Loading RDF data...");
		SesameAdapter.reset();

		File f;

		f = new File("./data/" + scenario + "/ontology.n3");
		if (f.exists())
			SesameAdapter.getInstance(RepoType.MAIN).loadFromFile(
					"./data/" + scenario + "/ontology.n3");
		else {
			f = new File("./data/" + scenario + "/ontology.ttl");

			if (f.exists())
				SesameAdapter.getInstance(RepoType.MAIN).loadFromFile(
						"./data/" + scenario + "/ontology.ttl");
			else
				SesameAdapter.getInstance(RepoType.MAIN).loadFromFile(
						"./ontology/ontology.rdf");
		}

		// copy data from main repository
		System.out.println("Transferring base copy of data "
				+ "into evaluation repository...");
		SesameAdapter.transfer();
	}
}
