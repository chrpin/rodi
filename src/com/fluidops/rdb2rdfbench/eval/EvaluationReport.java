package com.fluidops.rdb2rdfbench.eval;

import java.util.Set;

/**
 * Represents the result of an individual evaluation, i.e., the result of
 * comparing any two {@link QueryResultSet}s.
 * 
 * @author cp
 *
 */
public class EvaluationReport {

	private String title;
	private double precision;
	private double recall;
	private double f;
	private Set<String> categories;

	/**
	 * Constructor. Creates a report.
	 * 
	 * @param title
	 *            Report title.
	 * @param precision
	 *            Measured precision.
	 * @param recall
	 *            Measured recall.
	 * @param f
	 *            Reported F1 measure.
	 * @param categories
	 *            List of category IDs where this report fits in.
	 */
	public EvaluationReport(String title, double precision, double recall,
			double f, Set<String> categories) {
		this.title = title;
		this.precision = precision;
		this.recall = recall;
		this.f = f;
		this.categories = categories;
	}

	/**
	 * Returns the report title.
	 * 
	 * @return Report title.
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Returns reported precision.
	 * 
	 * @return Measured precision.
	 */
	public double getPrecision() {
		return precision;
	}

	/**
	 * Returns reported recall.
	 * 
	 * @return Measured recall.
	 */
	public double getRecall() {
		return recall;
	}

	/**
	 * Returns the reported F1 measure.
	 * 
	 * @return Reported F1 measure.
	 */
	public double getFMeasure() {
		return f;
	}

	/**
	 * Returns all category IDs (group tags) of this report.
	 * 
	 * @return Categories.
	 */
	public Set<String> getCategories() {
		return categories;
	}

	/**
	 * Tests whether the report is tagged as belonging to the specified
	 * category.
	 * 
	 * @param category
	 *            Category ID.
	 * @return True, if report belongs to category, otherwise false.
	 */
	public boolean hasCategory(String category) {
		return (categories.contains(category));
	}

	@Override
	public String toString() {
		return "[ Evaluation report '" + title + "': score = " + f
				+ "; precision = " + precision + ", recall = " + recall + "]";
	}

	public String toTabularString() {
		return title + "|" + f + "|" + precision + "|" + recall;
	}
}
