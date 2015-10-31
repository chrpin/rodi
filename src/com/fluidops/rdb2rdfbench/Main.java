package com.fluidops.rdb2rdfbench;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.openrdf.query.MalformedQueryException;
import org.openrdf.query.QueryEvaluationException;
import org.openrdf.query.UpdateExecutionException;
import org.openrdf.repository.RepositoryException;
import org.openrdf.rio.RDFHandlerException;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;
import org.semanticweb.owlapi.model.OWLOntologyStorageException;

import com.fluidops.rdb2rdfbench.db.rdf.SesameAdapter;
import com.fluidops.rdb2rdfbench.db.rdf.SesameAdapter.RepoType;
import com.fluidops.rdb2rdfbench.eval.EvaluationReport;
import com.fluidops.rdb2rdfbench.eval.Evaluator;
import com.fluidops.rdb2rdfbench.eval.Evaluator.EvalStep;
import com.fluidops.rdb2rdfbench.util.ReportWriter;
import com.fluidops.rdb2rdfbench.util.SetupUtil;

/**
 * Main class, invokes benchmark suite with parameters.
 * 
 * @author cp
 *
 */
public class Main {

	public static void main(String[] args) throws IOException,
			InterruptedException, RepositoryException,
			OWLOntologyCreationException, MalformedQueryException,
			QueryEvaluationException, RDFHandlerException,
			OWLOntologyStorageException, UpdateExecutionException {

		// read config
		Config cfg = Config.getInstance();
		String[] scenarios = cfg.getScenarios();

		// read command line arguments
		int manualActions = 0;
		boolean doSetup = false;
		boolean doEval = false;
		Evaluator.EvalStep evalStep = EvalStep.ALL;
		boolean importMainData = false;
		boolean exportMainData = false;
		boolean importEvalData = false;
		boolean exportEvalData = false;
		boolean debugQueries = false;
		boolean wipeReports = false;
		String runTitle = "";
		for (int i = 0; i < args.length; i++) {
			if (args[i].equals("--setup")) {
				manualActions++;
				doSetup = true;
			} else if (args[i].equals("--eval")) {
				manualActions++;
				doEval = true;
			} else if (args[i].equals("--eval-r2rml")) {
				manualActions++;
				doEval = true;
				evalStep = EvalStep.R2RML_ONLY;
			} else if (args[i].equals("--eval-reasoning")) {
				manualActions++;
				doEval = true;
				evalStep = EvalStep.REASONING_ONLY;
			} else if (args[i].equals("--eval-queries")) {
				manualActions++;
				doEval = true;
				evalStep = EvalStep.QUERIES_ONLY;
			} else if (args[i].equals("--debug-queries")) {
				debugQueries = true;
			} else if (args[i].equals("--wipe-reports")) {
				wipeReports = true;
			} else if (args[i].equals("--import-base")) {
				manualActions++;
				importMainData = true;
			} else if (args[i].equals("--export-base")) {
				manualActions++;
				exportMainData = true;
			} else if (args[i].equals("--import-eval")) {
				manualActions++;
				importEvalData = true;
			} else if (args[i].equals("--export-eval")) {
				manualActions++;
				exportEvalData = true;
			} else if (args[i].equals("--help")) {
				System.out.println("Parameters:");
				System.out.println("===========");

				System.out.println("[ Manual control flow parameters ]");
				System.out.println("The following parameters will "
						+ "switch to manual control.");
				System.out.println("After executing the specified command, "
						+ "the framework will exit.");
				System.out
						.println("All of those commands are mutually exclusive, "
								+ "only one command can be executed at a time.");

				System.out.println("--setup");
				System.out.println("\tPrepares the configured scenario, "
						+ "cleaning repositories and loading data.");

				System.out.println("--eval");
				System.out.println("\tPerforms a complete input evaluation.\n"
						+ "\tThis corresponds to invoking "
						+ "--eval-r2rml, --eval-reasoning and\n"
						+ "\t--eval-queries sequentially.");

				System.out.println("--eval-r2rml");
				System.out.println("\tExecutes provided mappings, "
						+ "i.e., loads mapped data.");

				System.out.println("--eval-reasoning");
				System.out.println("\tRuns the reasoner on loaded data "
						+ "to add additional, inferrable facts.");

				System.out.println("--eval-queries");
				System.out.println("\tEvaluates all test queries "
						+ "on loaded data.");

				System.out.println("--debug-queries");
				System.out.println("\tLog detailed explanations and "
						+ "query results in reports directory.\n"
						+ "\t works with --eval or --eval-queries, only.");

				System.out.println("--wipe-reports");
				System.out.println("\tCleans the reports directory.");

				System.out.println("--import-base");
				System.out.println("\tImports data from a file import.rdf, "
						+ "which must be present in the current working\n"
						+ "\tdirectory in RDF/XML format. Replaces all "
						+ "existing data with the newly imported data.\n"
						+ "\tOverwrites both the base data (which remains "
						+ "unchanged during evaluation) and temporary copy.");

				System.out.println("--export-base");
				System.out.println("\tExports base data to a file export.rdf "
						+ "and places it in the current working directory\n"
						+ "\tas RDF/XML. The base copy of data represents "
						+ "the unchanged state of data, as previously\n"
						+ "\timported, either manually or through --setup.");

				System.out.println("--import-temp");
				System.out.println("\tImports data from a file import.rdf, "
						+ "which must be present in the current working\n"
						+ "\tdirectory in RDF/XML format into the temporary, "
						+ "changeable evaluation repository without\n"
						+ "\ttampering with the base data repository. "
						+ "Note, that temporary data will be changed\n"
						+ "\tor replaced with a base copy of the data "
						+ "at several stages of the process.");

				System.out.println("--export-temp");
				System.out.println("\tExports temporary working data in "
						+ "its current state into the working directory\n"
						+ "\t(as RDF/XML). Working data is based on the\n"
						+ "imported base data but may additionally \n"
						+ "\tcontain results from executed mappings or "
						+ "reasoning artifacts, depending on the current\n"
						+ "\tstage of the process.");

				System.out.println("[ Additional parameters ]");

				System.out.println("--scenario=SCENARIO_ID");
				System.out.println("\tSets the specified scenario, "
						+ "overriding configuration.");
				System.out.println("--title=SOME_TITLE");
				System.out.println("\tSets an explicit title to the current "
						+ "benchmark run, has no effect in automatic mode.");
				System.out.println("--help");
				System.out.println("\tPrints this help page and exits.");

				System.exit(0);

			} else if (args[i].startsWith("--scenario")) {
				scenarios = new String[1];
				scenarios[0] = args[i].substring(11);
			} else if (args[i].startsWith("--title")) {
				runTitle = args[i].substring(8);
			} else {
				System.err.println("Unknown command line argument: " + args[i]);
				System.err.println("Try --help");
				System.exit(1);
			}
		}

		// checking for basic configuration consistency
		if (scenarios.length == 0) {
			System.err.println("Configuration error: missing scenario.");
			System.exit(1);
		} else if (manualActions > 0 && scenarios.length > 1) {
			System.err.println("Configuration error: ambiguous scenario "
					+ "in cli controlled mode.");
			System.exit(1);
		} else if (manualActions > 1) {
			System.err.println("Configuration error: "
					+ "manually triggered actions are mutually exclusive. "
					+ "See --help.");
			System.exit(1);
		}

		if (manualActions == 0 && !runTitle.isEmpty()) {
			System.err.println("Warning: --title has no effect "
					+ "in automatic/batch mode.");
		}

		if (debugQueries && !doEval) {
			System.err.println("Warning: --debug-queries has no effect "
					+ "unless in query evalution mode.");
		}

		// run requested steps
		if (wipeReports) {
			File reportsDir = new File("./reports");
			System.out.println("Sweeping: removing "
					+ reportsDir.listFiles().length + " report files...");
			for (File rep : reportsDir.listFiles()) {
				rep.delete();
			}
		}

		if (manualActions == 0)
			Evaluator.automaticWorkflow(scenarios);
		else { // manual steps
			System.out.println("Scenario set to " + scenarios[0] + ".");

			if (doSetup)
				SetupUtil.setupScenario(scenarios[0]);

			if (doEval) {

				if (evalStep == EvalStep.ALL || evalStep == EvalStep.R2RML_ONLY) {
					Evaluator.runR2Rml(scenarios[0]);
				}

				if (evalStep == EvalStep.ALL
						|| evalStep == EvalStep.REASONING_ONLY) {
					Evaluator.runReasoning();
				}

				if (evalStep == EvalStep.ALL
						|| evalStep == EvalStep.QUERIES_ONLY) {
					System.out.println("Starting evaluation...");
					System.out.println("======================");

					List<EvaluationReport> reps = Evaluator.evaluate(
							scenarios[0], debugQueries);

					System.out.println("Evaluation complete.");
					System.out.println("====================\n");

					ReportWriter.materializeTextualReports(scenarios[0],
							runTitle, reps);
					ReportWriter.materializeTabularReports(scenarios[0],
							runTitle, reps);
				}
			}

			if (importMainData) {
				System.out.println("Trying to import data into main (base) "
						+ "repository from file ./import.rdf.");

				SesameAdapter ses = SesameAdapter.getInstance(RepoType.MAIN);
				ses.cleanup();
				ses.loadFromFile("./import.rdf");

				System.out.println("Transferring base copy of data "
						+ "into evaluation repository...");
				SesameAdapter.getInstance(RepoType.EVALUATION).cleanup();
				SesameAdapter.transfer();
			}

			if (exportMainData) {
				System.out.println("Trying to export data of main (base) "
						+ "reposiory into file ./export.rdf...");

				SesameAdapter ses = SesameAdapter.getInstance(RepoType.MAIN);
				ses.exportToFile("./export.rdf");
			}

			if (importEvalData) {
				System.out.println("Trying to import data into temporary "
						+ "(evaluation) repository from file ./import.rdf.");

				SesameAdapter ses = SesameAdapter
						.getInstance(RepoType.EVALUATION);
				ses.cleanup();
				ses.loadFromFile("./import.rdf");
			}

			if (exportEvalData) {
				System.out.println("Trying to export data from temporary "
						+ "(evaluation) repository into file ./export.rdf.");

				SesameAdapter ses = SesameAdapter
						.getInstance(RepoType.EVALUATION);
				ses.exportToFile("./export.rdf");
			}

			System.out.println("done.");

			System.out.println("Shutting down triplestore...");
			SesameAdapter.shutdown();
			System.out.println("done.");
		}
	}
}
