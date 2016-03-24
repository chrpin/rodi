package com.fluidops.rdb2rdfbench.util;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Collection;

import org.openrdf.model.Value;

import com.fluidops.rdb2rdfbench.Config;
import com.fluidops.rdb2rdfbench.eval.EvaluationReport;
import com.fluidops.rdb2rdfbench.eval.QueryResultChecker;

/**
 * Utility class to write evaluation reports to disk.
 * 
 * @author cp
 *
 */
public class ReportWriter {

	public static void materializeTextualReports(String scenario,
			String prefix, Collection<EvaluationReport> reps)
			throws IOException {
		Config cfg = Config.getInstance();

		String fullReport = "";
		for (EvaluationReport rep : reps) {
			fullReport += rep.toString() + "\n";
		}

		String fn = "./reports/" + prefix + (prefix.isEmpty() ? "" : "_")
				+ scenario + "_reasoning_" + cfg.getReasoning() + ".txt";

		BufferedWriter writer = new BufferedWriter(new FileWriter(fn));
		writer.write(fullReport);
		writer.close();

		System.out.println("Reports written to " + fn);
	}

	public static void materializeTabularReports(String scenario,
			String prefix, Collection<EvaluationReport> reps)
			throws IOException {
		Config cfg = Config.getInstance();

		String fullReporTabular = "";
		for (EvaluationReport rep : reps) {
			fullReporTabular += rep.toTabularString() + "\n";
		}

		String fn = "./reports/tabular_" + prefix
				+ (prefix.isEmpty() ? "" : "_") + scenario + "_reasoning_"
				+ cfg.getReasoning() + ".txt";

		BufferedWriter writer = new BufferedWriter(new FileWriter(fn));
		writer.write(fullReporTabular);
		writer.close();

		System.out.println("Tabular reports written to " + fn);
	}

	private static String cleanFileName(String name) {
		name = name.replaceAll("[^a-zA-Z0-9_\\.]", "_");
		name = name.replaceAll("___", "_");
		name = name.replaceAll("__", "_");
		return name;
	}

	public static void debugReport(QueryResultChecker qrc) throws IOException {

		String fn = "./reports/"
				+ cleanFileName("debug_" + qrc.getTitle() + ".txt");
		BufferedWriter writer = new BufferedWriter(new FileWriter(fn));
		
		StringBuilder sb = new StringBuilder();
		sb.append(qrc.getTitle());
		sb.append("\n\n");
		sb.append("Short: ");
		sb.append(qrc.getReport().toString());
		sb.append("\n\nTuples correctly matched:\n");
		sb.append("=========================\n");
		writer.write(sb.toString());
		
		for (Value[] t : qrc.getMatchedTuples()) {
			sb = new StringBuilder();
			
			sb.append("( ");
			for (Value v : t) {
				sb.append(v == null ? "null" : v.stringValue());
				sb.append("\t");
			}
			sb.append(")\n");
			
			writer.write(sb.toString());
		}
		
		sb = new StringBuilder();
		sb.append("\n\nTuples missing (lowering recall):\n");
		sb.append("====================================\n");
		writer.write(sb.toString());
		
		for (Value[] t : qrc.getMissingTuples()) {
			sb = new StringBuilder();
			sb.append("( ");
			for (Value v : t) {
				sb.append(v == null ? "null" : v.stringValue());
				sb.append("\t");
			}
			sb.append(")\n");
			writer.write(sb.toString());
		}
		
		sb = new StringBuilder();
		sb.append("\n\nUnexpected tuples (lowering precision):\n");
		sb.append("====================================\n");
		writer.write(sb.toString());
		
		for (Value[] t : qrc.getUnmatchedTuples()) {
			sb = new StringBuilder();
			sb.append("( ");
			for (Value v : t) {
				sb.append(v == null ? "null" : v.stringValue());
				sb.append("\t");
			}
			sb.append(")\n");
			writer.write(sb.toString());
		}
		
		sb = new StringBuilder();
		sb.append("\n\nLocal (per-column) precisions:\n");
		try {
			sb.append(qrc.getLocalPrecisions());
		} catch (RuntimeException e) {
			sb.append("(cannot calculate)");
		}

		writer.write(sb.toString());

		writer.close();

		System.out.println("Detailed query debugging report written to " + fn);
	}
}
