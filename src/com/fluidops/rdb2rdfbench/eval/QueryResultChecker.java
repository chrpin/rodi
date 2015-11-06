package com.fluidops.rdb2rdfbench.eval;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.openrdf.model.BNode;
import org.openrdf.model.Value;

/**
 * Compares to query results (in terms of {@link QueryResultSet}s) according to
 * the equivalence metric defined in the paper. Also calculates precision and
 * recall and provides helper methods for result debugging.
 * 
 * @author cp
 *
 */
public class QueryResultChecker {

	private String title;
	private SparqlResultSet result;
	private QueryResultSet reference;
	private QueryMapping qm;
	private Map<Integer, Integer> establishedMatches;
	private float precision;
	private float recall;
	private Set<String> categories;

	/**
	 * Constructor. Matches any {@link QueryResultSet} against some reference
	 * result set.
	 * 
	 * @param title
	 *            Sets a title of the evaluation (e.g., query name or run
	 *            identifier)
	 * @param result
	 *            Tested query result set.
	 * @param reference
	 *            Reference result set.
	 * @param qm
	 *            Mapping of query columns/variables.
	 * @param categories
	 *            Category IDs ("group tags") from {@link QueryPair}
	 *            specification.
	 */
	public QueryResultChecker(String title, SparqlResultSet result,
			QueryResultSet reference, QueryMapping qm, Set<String> categories) {
		this.title = title;
		this.result = result;
		this.reference = reference;
		this.qm = qm;
		this.categories = categories;

		if (this.qm == null) {
			if (reference.size() > 0)
				this.qm = new QueryMapping(reference.get(0).length);
			else
				this.qm = new QueryMapping(0);
		}

		establishedMatches = equivalenceTests(this.qm);

		if (result.size() == 0)
			precision = 0;
		else
			precision = (float) establishedMatches.size()
					/ (float) result.size();

		if (reference.size() == 0)
			recall = 1;
		else
			recall = (float) establishedMatches.size()
					/ (float) reference.size();
	}

	/**
	 * Returns the title of the evaluated {@link QueryPair}.
	 * 
	 * @return Title.
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Returns all category IDs (group tags) of this report.
	 * 
	 * @return Categories.
	 */
	public Set<String> getCategories() {
		return categories;
	}

	private Set<Integer> getLiteralMatchCandidates(
			Map<String, Set<Integer>>[] index, String refValue, int varCol) {

		if (index[varCol] == null) {
			// create column index
			index[varCol] = new HashMap<String, Set<Integer>>();

			for (int i = 0; i < result.size(); i++) {
				// nulls are non-results, no need to compare
				if (result.get(i)[varCol] != null) {
					String colVal = result.get(i)[varCol].stringValue();
					if (index[varCol].containsKey(colVal))
						index[varCol].get(colVal).add(i);
					else {
						Set<Integer> set = new HashSet<Integer>();
						set.add(i);
						index[varCol].put(colVal, set);
					}
				}
			}
		}

		if (index[varCol].containsKey(refValue))
			return index[varCol].get(refValue);
		else
			return new HashSet<Integer>();
	}

	private Set<Integer> intersectCandidates(Set<Integer> matchCandidates,
			Set<Integer> literalMatchCandidates) {
		Set<Integer> ret = new HashSet<Integer>();

		if (literalMatchCandidates == null) {
			// add all possible tuples/no restrictions
			literalMatchCandidates = new HashSet<Integer>();
			for (int i = 0; i < result.size(); i++)
				literalMatchCandidates.add(i);
		}

		for (Integer candi : literalMatchCandidates)
			if (matchCandidates == null || matchCandidates.contains(candi))
				ret.add(candi);

		return ret;
	}

	private boolean confirmMatch(Value[] tuple1, Value[] tuple2, QueryMapping qm) {

		for (Integer col : qm.keySet()) {
			Integer matchVar = qm.get(col);

			if (tuple1[col] != null && tuple2[matchVar] == null)
				return false;

			if (tuple1[col] != null
					&& !(tuple1[col] instanceof BNode)
					&& !tuple1[col].stringValue().equals(
							tuple2[matchVar].stringValue()))
				return false;
		}

		return true;
	}

	private Map<Integer, Integer> equivalenceTests(QueryMapping qm) {
		Map<Integer, Integer> ret = new HashMap<Integer, Integer>();
		Set<Integer> processedTuples = new HashSet<Integer>();
		Set<Integer> processedMatches = new HashSet<Integer>();

		if (result.size() == 0 || reference.size() == 0)
			return ret;

		@SuppressWarnings("unchecked")
		Map<String, Set<Integer>>[] perColLiteralIndex = new HashMap[result
				.get(0).length];

		for (int i = 0; i < reference.size(); i++) {

			// already matched?
			if (processedTuples.contains(i))
				continue;

			// building candidate set
			Value[] tuple = reference.get(i);
			Set<Integer> matchCandidates = null;
			Set<Integer> localDependencies = new HashSet<Integer>();

			// check each mapped column
			for (Integer col : qm.keySet()) {
				Integer matchVar = qm.get(col);

				if (tuple[col] instanceof BNode) {
					// placeholder matching dependencies (resolve later)
					localDependencies.addAll(reference
							.getDependencies(tuple[col]));
				} else {
					// literal matching
					if (matchCandidates != null && matchCandidates.size() < 10)
						continue; // need no more filtering

					String refVal = null;
					if (tuple[col] != null)
						refVal = tuple[col].stringValue();

					matchCandidates = intersectCandidates(
							matchCandidates,
							getLiteralMatchCandidates(perColLiteralIndex,
									refVal, matchVar));
				}
			}

			if (matchCandidates.size() == 0) {
				processedTuples.add(i);
				continue; // no can do
			}

			for (Integer ci : matchCandidates) {
				if (confirmMatch(tuple, result.get(ci), qm)) {
					ret.put(i, ci);
					processedTuples.add(i);
					processedMatches.add(ci);
					break;
				}
			}

			// check & resolve cross-dependencies
			// TODO: ... really check ...
			if (localDependencies.size() > 1)
				System.err
						.println("warning: ignoring intra-result set dependencies");

		}

		return ret;
	}

	/**
	 * Returns the precision of the result set as compared to the reference
	 * result set (under query result set equivalence).
	 * 
	 * @return Precision.
	 */
	public float getPrecision() {
		return precision;
	}

	/**
	 * Returns the recall of the result set as compared to the reference result
	 * set (under query result set equivalence).
	 * 
	 * @return Recall.
	 */
	public float getRecall() {
		return recall;
	}

	/**
	 * Returns the F-measure (F1 measure) of the result set as compared to the
	 * reference result set (under query result set equivalence).
	 * 
	 * @return F measure.
	 */
	public float getFMeasure() {
		return 2 * (precision * recall) / (precision + recall);
	}

	/**
	 * Builds and returns a standard {@link EvaluationReport}, containing
	 * precision, recall and F-measure as well as some auxiliary numbers.
	 * 
	 * @return Evaluation report.
	 */
	public EvaluationReport getReport() {
		return new EvaluationReport(title, precision, recall, getFMeasure(),
				categories);
	}

	/**
	 * Helper method for result set debugging. Returns the list of correctly
	 * matched tuples, i.e., tuples in the result set that have a unique
	 * equivalent tuple in the reference result set.
	 * 
	 * @return List of correct tuples in result set. Note that URIs/keys have
	 *         been replaced by arbitrary blank nodes in tuple positions where
	 *         ID equivalence matching has been performed.
	 */
	public List<Value[]> getMatchedTuples() {
		List<Value[]> ret = new ArrayList<Value[]>();

		for (Integer tupleNum : establishedMatches.keySet())
			ret.add(result.get(establishedMatches.get(tupleNum)));

		return ret;
	}

	/**
	 * Helper method for result set debugging. Returns a list of unmatched
	 * tuples in the result set, i.e., tuples that are wrong (have no unique
	 * equivalent in the reference set) and contribute to lowering precision.
	 * 
	 * @return List of incorrect tuples in result set. Note that URIs/keys have
	 *         been replaced by arbitrary blank nodes in tuple positions where
	 *         ID equivalence matching has been performed.
	 */
	public List<Value[]> getUnmatchedTuples() {
		List<Value[]> ret = new ArrayList<Value[]>();
		Collection<Integer> matched = establishedMatches.values();

		for (int i = 0; i < result.size(); i++)
			if (!matched.contains(i))
				ret.add(result.get(i));

		return ret;
	}

	/**
	 * Helper method for result set debugging. Returns a list of tuples that are
	 * expected by the reference result but have no equivalent in the actual
	 * result set. Those tuples contribute to lowering recall.
	 * 
	 * @return List of reference tuples missing in result set. Note that
	 *         URIs/keys have been replaced by arbitrary blank nodes in tuple
	 *         positions where ID equivalence matching has been performed.
	 */
	public List<Value[]> getMissingTuples() {
		List<Value[]> ret = new ArrayList<Value[]>();

		for (int i = 0; i < reference.size(); i++)
			if (!establishedMatches.containsKey(i))
				ret.add(reference.get(i));

		return ret;
	}

	private List<Double> getLocalPrecisionRecall(boolean isPrecision) {
		if (result.size() == 0)
			throw new RuntimeException(
					"Cannot calculate local precision/recall values "
							+ "on empty result set.");

		List<Double> ret = new ArrayList<Double>();

		for (int i = 0; i < result.get(0).length; i++) {
			if (qm.values().contains(i)) {
				int var = i;
				Integer col = null;

				for (Integer c : qm.keySet())
					if (qm.get(c) == var) {
						col = c;
						break;
					}

				if (col == null) {
					ret.add(null);
					continue;
				}

				Map<Integer, Integer> col2Var = new HashMap<Integer, Integer>();
				col2Var.put(col, var);
				QueryMapping localQm = new QueryMapping(col2Var);
				Map<Integer, Integer> localMatches = equivalenceTests(localQm);

				if (isPrecision)
					ret.add((double) localMatches.size() / (double) result.size());
				else
					ret.add((double) localMatches.size()
							/ (double) reference.size());
			}
		}

		return ret;
	}

	/**
	 * Helper method for result set debugging. Calculates a list of local
	 * per-variable precisions. Variable precision is the precision that would
	 * result if equality was checked on one particular result variable only
	 * (rather than on complete tuples). Works on mapped variables only, local
	 * precisions for all other variables is null.
	 * 
	 * @return List of local precisions.
	 */
	public List<Double> getLocalPrecisions() {

		return getLocalPrecisionRecall(true);
	}

	/**
	 * Helper method for result set debugging. Calculates a list of local
	 * per-variable recall values. Variable recall is the recall value that
	 * would result if equality was checked on one particular result variable
	 * only (rather than on complete tuples). Works on mapped variables only,
	 * local recall for all other variables is null.
	 * 
	 * @return List of local recall values.
	 */
	public List<Double> getLocalRecalls() {
		return getLocalPrecisionRecall(false);
	}
}
