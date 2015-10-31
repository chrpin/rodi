package com.fluidops.rdb2rdfbench.db.rel;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.fluidops.rdb2rdfbench.Config;

/**
 * Helper methods to deal with connecting to the source RDBMS.
 * 
 * @author cp
 *
 */
public class RdbmsUtil {

	public static Connection getConnection() throws SQLException {
		Config cfg = Config.getInstance();

		Connection conn = null;
		Properties connectionProps = new Properties();
		connectionProps.put("user", cfg.getDbUser());
		connectionProps.put("password", cfg.getDbPassword());

		conn = DriverManager.getConnection(cfg.getJdbc(), connectionProps);

		return conn;
	}

	public static void loadPostgresDump(String fileName) throws IOException,
			InterruptedException {

		Config cfg = Config.getInstance();

		String cmd = cfg.getDbCmd() + " -h" + cfg.getDbHost() + " -p"
				+ cfg.getDbPort() + " -d" + cfg.getPostgresDb() + " -U"
				+ cfg.getDbUser() + " -f" + fileName;

		String[] env = { "PGPASSWORD=" + cfg.getDbPassword() };
		Process psql = Runtime.getRuntime().exec(cmd, env);

		// read any errors from the attempted command
		BufferedReader stdError = new BufferedReader(new InputStreamReader(
				psql.getErrorStream()));
		String s = null;
		while ((s = stdError.readLine()) != null) {
			System.err.println("Warning: "
					+ "PSQL dump loading process reporting errors "
					+ "(running command " + cmd
					+ ", password set in environment parameter):");
			System.err.println(s);
		}

		psql.waitFor();

		if (psql.exitValue() != 0)
			throw new RuntimeException("PSQL dump loading process failed "
					+ "on non-zero error exit status " + psql.exitValue()
					+ " (running command " + cmd
					+ ", password set in environment parameter)");
	}

	public static void loadMySQLDump(String fileName) throws IOException,
			InterruptedException {

		Config cfg = Config.getInstance();

		String cmd = cfg.getDbCmd() + " --host=" + cfg.getDbHost() + " --port="
				+ cfg.getDbPort() + " --user=" + cfg.getDbUser()
				+ " --password=" + cfg.getDbPassword();
		
		
		System.out.println("\t" + cmd);

		FileReader fr = new FileReader(new File(fileName));
		BufferedReader br = new BufferedReader(fr);

		Process mysql = Runtime.getRuntime().exec(cmd);

		OutputStream stdin = mysql.getOutputStream();
		BufferedWriter writer = new BufferedWriter(
				new OutputStreamWriter(stdin));

		String lne;
		while ((lne = br.readLine()) != null)
			writer.write(lne);

		writer.flush();
		writer.close();
		br.close();

		// read any errors from the attempted command
		BufferedReader stdError = new BufferedReader(new InputStreamReader(
				mysql.getErrorStream()));
		String s = null;
		while ((s = stdError.readLine()) != null) {
			System.err.println("Warning: "
					+ "MySQL dump loading process reporting errors "
					+ "(running command " + cmd + ")");
			System.err.println(s);
		}

		mysql.waitFor();

		if (mysql.exitValue() != 0)
			throw new RuntimeException("MySQL dump loading process failed "
					+ "on non-zero error exit status " + mysql.exitValue()
					+ " (running command " + cmd + ")");
	}
}
