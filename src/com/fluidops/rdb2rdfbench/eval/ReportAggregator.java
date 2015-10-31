package com.fluidops.rdb2rdfbench.eval;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Performs average aggregation on {@link EvaluationReport}s by a choice of
 * selection criteria.
 * 
 * @author cp
 *
 */
public class ReportAggregator {

	private Collection<EvaluationReport> reports;

	/**
	 * Constructor. Creates aggregator instance for specified input reports
	 * 
	 * @param individualReports
	 *            Input reports to be aggregated.
	 */
	public ReportAggregator(Collection<EvaluationReport> individualReports) {
		reports = individualReports;
	}

	/**
	 * Calculates and returns an {@link EvaluationReport}, which is based on the
	 * average of its input reports.
	 * 
	 * @return Averaged report.
	 */
	public EvaluationReport averageAll() {
		return calculateAverageReport(reports, "All (AVG)");
	}

	/**
	 * Retrieves a list of all categories that contain one or more of the input
	 * reports.
	 * 
	 * @return Category IDs.
	 */
	public Collection<String> availableCategories() {
		Set<String> ret = new HashSet<String>();

		for (EvaluationReport rep : reports)
			ret.addAll(rep.getCategories());

		return ret;
	}

	/**
	 * Calculates and returns an {@link EvaluationReport}, which is based on the
	 * average of those input reports that belong to the specified category.
	 * {@link EvaluationReport}s created during query evaluation are tagged with
	 * all categories of the {@link QueryPair} that they report on.
	 * 
	 * @param category
	 *            Category of input reports to consider.
	 * @return Averaged report.
	 */
	public EvaluationReport averageOfCategory(String category) {
		List<EvaluationReport> in = new ArrayList<EvaluationReport>();

		for (EvaluationReport rep : reports)
			if (rep.hasCategory(category))
				in.add(rep);

		return calculateAverageReport(in, category + " (AVG)");
	}

	/**
	 * Returns a series of averaged reports, one for each category that contains
	 * one or more of the input reports.
	 * 
	 * @return List of averaged reports.
	 */
	public Collection<EvaluationReport> allAveragesByCategory() {
		List<EvaluationReport> ret = new ArrayList<EvaluationReport>();

		for (String cat : availableCategories())
			ret.add(averageOfCategory(cat));

		return ret;
	}

	private float getFMeasure(float precision, float recall) {
		return 2 * (precision * recall) / (precision + recall);
	}

	private EvaluationReport calculateAverageReport(
			Collection<EvaluationReport> reports, String title) {

		float precisionSum = 0;
		float recallSum = 0;

		for (EvaluationReport rep : reports) {
			precisionSum += rep.getPrecision();
			recallSum += rep.getRecall();
		}

		float avgPrecision = precisionSum / (float) reports.size();
		float avgRecall = recallSum / (float) reports.size();

		return new EvaluationReport(title, avgPrecision, avgRecall,
				getFMeasure(avgPrecision, avgRecall), new HashSet<String>());
	}
}
