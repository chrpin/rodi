package com.fluidops.rdb2rdfbench;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Enumeration;
import java.util.Properties;

/**
 * Central configuration. Default values can be overloaded with entries from
 * main config.prop file.
 * 
 * @author cp
 *
 */
public class Config {

	private static Config me = null;

	private void override(String key, String value) {
		Field[] fields = Config.class.getDeclaredFields();
		boolean found = false;

		for (Field field : fields)
			if (field.getName().equals(key)) {
				try {
					found = true;
					field.set(this, value);
				} catch (IllegalArgumentException | IllegalAccessException e) {
					System.err.println("Unexpected error "
							+ "while loading configuration parameter " + key
							+ ". Using default value.");
				}
			}

		if (!found)
			System.err
					.println("Warning: could not set configuration parameter "
							+ key + ": no such parameter.");
	}

	private void load() {
		try {
			FileInputStream fileStream = new FileInputStream(new File(
					"config.prop"));
			Properties properties = new Properties();
			properties.load(fileStream);
			fileStream.close();

			for (Enumeration<Object> propSeries = properties.keys(); propSeries
					.hasMoreElements();) {
				String key = (String) propSeries.nextElement();
				String value = properties.getProperty(key);

				override(key, value);
			}
		} catch (FileNotFoundException e) {
			System.err.println("Warning: cannot open main benchmark "
					+ "configuration (config.prop), using default settings.");
		} catch (IOException e) {
			throw new RuntimeException("Error reading benchmark config.prop: "
					+ e);
		}
	}

	/**
	 * Singleton. Loads configuration from file and returns initialized
	 * {@link Config} object.
	 * 
	 * @return Singleton instance.
	 */
	public static Config getInstance() {

		if (me == null) {
			me = new Config();
			me.load();
		}

		return me;
	}

	/**
	 * Returns the JDBC connection string, composed of all values that are
	 * contained in it, e.g., jdbc:postgresql://localhost:5432/postgres
	 * 
	 * @return JDBC connection string.
	 */
	public String getJdbc() {
		if (selectDbms.equals("mysql")) {
			return "jdbc:mysql://" + getDbHost() + ":" + getDbPort();
		} else {
			return "jdbc:postgresql://" + getDbHost() + ":" + getDbPort() + "/"
					+ getPostgresDb();
		}
	}

	protected String dbHost = "localhost";

	/**
	 * Returns the host name of the PostgreSQL server. Default: localhost
	 * 
	 * @return Host name.
	 */
	public String getDbHost() {
		return dbHost;
	}

	protected String dbPort = "5432";

	/**
	 * Returns the port number of the PostgreSQL server. Default: 5432
	 * 
	 * @return Port.
	 */
	public String getDbPort() {
		return dbPort;
	}

	protected String postgresDb = "postgres";

	/**
	 * Returns the PostgreSQL database name to connect to. Default: postgres
	 * 
	 * @return Database name.
	 */
	public String getPostgresDb() {
		return postgresDb;
	}

	protected String dbUser = "postgres";

	/**
	 * Returns the user name for connecting to PostgreSQL. Default: postgres
	 * 
	 * @return Postgres user name.
	 */
	public String getDbUser() {
		return dbUser;
	}

	protected String dbPassword = "postgres";

	/**
	 * Returns the password for connecting to PostgreSQL. Default: postgres
	 * 
	 * @return Postgres password.
	 */
	public String getDbPassword() {
		return dbPassword;
	}

	protected String dbCmd = "/usr/bin/psql";

	/**
	 * Returns the path to the PostgreSQL command line utility psql. Default:
	 * "/usr/bin/psql"
	 * 
	 * @return Path to psql.
	 */
	public String getDbCmd() {
		return dbCmd;
	}

	protected String selectDbms = "";

	/**
	 * Set to "mysql" to use a MySQL DB instead of the default PostgreSQL.
	 * Default: ""
	 * 
	 * @return DB change flag.
	 */
	public String getSelectDbms() {
		return selectDbms;
	}

	protected String scenario = "cmt_renamed,conference_renamed,sigkdd_renamed,"
			+ "cmt_structured,conference_structured,sigkdd_structured,"
			+ "cmt_denormalized,conference_noconstraints,sigkdd_mixed";

	/**
	 * Returns the names/identifiers of scenarios to run (batch mode, only).
	 * Default: (all default scenarios)
	 * 
	 * @return Scenarios
	 */
	public String[] getScenarios() {
		return scenario.split(",");
	}

	protected String r2rmlPath = "./r2rml/";

	/**
	 * Returns the location of R2RML mappings, relative to the current working
	 * directory. If the location is an existing directory rather than a file,
	 * the framework will use any files residing in that directory. To turn off
	 * managed R2RML execution, set to empty string. In this case, the tested
	 * tool would need to apply its mappings autonomously and materialize
	 * triples to the evaluation target directory. Default: ./r2rml/
	 * 
	 * @return R2RML path.
	 */
	public String getR2RmlPath() {
		return r2rmlPath;
	}

	protected String readyFile = "./READY.txt";

	/**
	 * In automatic/batch mode, the framework will create a file to signal when
	 * a scenario is set up and ready to receive fresh R2RML mappings for
	 * evaluation. Default: ./READY.txt
	 * 
	 * @return R2RML path.
	 */
	public String getReadyFile() {
		return readyFile;
	}

	protected String reasoning = "simplified";

	/**
	 * Returns the reasoning mode, which could be one of "none", "simplified"
	 * (simplified rule based reasoning that effectively covers all needs of
	 * default scenarios, much faster), "hermit" (full reasoning with HermiT),
	 * "factpp" (full reasoning with FaCT++) or "konclude" (full reasoning with
	 * Konclude). Default: simplified
	 * 
	 * @return Reasoning mode.
	 */
	public String getReasoning() {
		return reasoning;
	}
}
