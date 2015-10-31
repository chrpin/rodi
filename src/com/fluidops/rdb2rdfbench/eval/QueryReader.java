package com.fluidops.rdb2rdfbench.eval;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class QueryReader {

	/**
	 * Loads all queries for a specified scenario.
	 * 
	 * @param scenario
	 *            Benchmark scenario.
	 * @return List of benchmark queries.
	 */
	public static List<QueryPair> getScenarioQueries(String scenario) {
		File dir = new File("./data/" + scenario + "/queries");
		Map<Integer, Set<QueryPair>> pairs = new HashMap<Integer, Set<QueryPair>>();

		if (!dir.isDirectory())
			throw new RuntimeException("Data directory not found for scenario "
					+ scenario + ": " + dir.getAbsolutePath());

		FileFilter ff = new FileFilter() {
			@Override
			public boolean accept(File pathname) {
				return pathname.getName().endsWith(".qpair");
			}
		};

		for (File file : dir.listFiles(ff)) {
			Properties properties = new Properties();
			try {
				FileInputStream fileStream = new FileInputStream(file);
				properties.load(fileStream);
				fileStream.close();
			} catch (IOException e) {
				throw new RuntimeException("Error: failed to load query file '"
						+ file + "': " + e);
			}

			String fileNameBase = file.getName();
			fileNameBase = fileNameBase.substring(0,
					fileNameBase.lastIndexOf('.'));

			String name = properties.getProperty("name");
			String sqlQuery = properties.getProperty("sql");
			String sparqlQuery = properties.getProperty("sparql");

			if (name == null || sqlQuery == null || sparqlQuery == null)
				throw new RuntimeException(
						"Corrupted query specification in file " + file
								+ " (missing one or more of the mandatory "
								+ "parameters name, sql, sparql)");

			Integer orderNum;

			try {
				orderNum = Integer.parseInt(properties.getProperty("orderNum"));
			} catch (NumberFormatException | NullPointerException e) {
				orderNum = 1000000;
			}

			if (!pairs.containsKey(orderNum))
				pairs.put(orderNum, new HashSet<QueryPair>());

			String catIdString = properties.getProperty("categories");
			Set<String> categories = new HashSet<String>();
			if (catIdString != null)
				for (String cat : catIdString.split(","))
					categories.add(cat.trim());

			QueryPair qp = new QueryPair(fileNameBase, name, sqlQuery,
					sparqlQuery, categories);

			if (properties.containsKey("entityIdCols")
					&& !properties.getProperty("entityIdCols").isEmpty()) {
				// id cols on SQL side
				String idColString = properties.getProperty("entityIdCols");

				for (String keySpec : idColString.split(";")) {
					if (keySpec.matches("[0-9]+"))
						qp.addSqlEntityIdColumn(Integer.parseInt(keySpec));
					else if (keySpec.matches("\\([0-9,]+\\)")) { // composite
						keySpec = keySpec.substring(1, keySpec.length() - 1);
						String[] colStrs = keySpec.split(",");
						Integer[] cols = new Integer[colStrs.length];
						for (int i = 0; i < colStrs.length; i++)
							cols[i] = Integer.parseInt(colStrs[i]);
						qp.addSqlEntityIdColumn(cols);
					} else
						throw new RuntimeException(
								"Error in query specification: entityIdCols: "
										+ idColString);
				}
			}

			if (properties.containsKey("entityIdVars")
					&& !properties.getProperty("entityIdVars").isEmpty()) {
				// id URIs (SPARQL)
				String idVarString = properties.getProperty("entityIdVars");

				for (String keySpec : idVarString.split(";"))
					if (keySpec.matches("[0-9]+"))
						qp.addSqlEntityIdColumn(Integer.parseInt(keySpec));
					else
						throw new RuntimeException(
								"Error in query specification: entityIdVars: "
										+ idVarString);
			}

			if (properties.containsKey("mapping")
					&& !properties.getProperty("mapping").isEmpty()) {
				// construct "mapping" between query columns/variables
				String mapStr = properties.getProperty("mapping");
				Map<Integer, Integer> mapping = new HashMap<Integer, Integer>();

				for (String map : mapStr.split(";")) {
					if (!map.matches("\\([0-9,]+\\)"))
						throw new RuntimeException(
								"Query mapping specification error: " + map);

					map = map.substring(1, map.length() - 1);
					String[] sqlToSparql = map.split(",");

					if (sqlToSparql.length != 2)
						throw new RuntimeException(
								"Query mapping specification error: " + map);

					mapping.put(Integer.parseInt(sqlToSparql[0]),
							Integer.parseInt(sqlToSparql[1]));
				}

				qp.setQueryMapping(new QueryMapping(mapping));
			}

			if (properties.containsKey("disabled")
					&& !properties.getProperty("disabled").isEmpty())
				qp.disable();

			pairs.get(orderNum).add(qp);
		}

		List<Integer> orderNums = new ArrayList<Integer>();
		orderNums.addAll(pairs.keySet());
		Collections.sort(orderNums);
		List<QueryPair> ret = new ArrayList<QueryPair>();
		for (int num : orderNums)
			ret.addAll(pairs.get(num));
		return ret;
	}
}
