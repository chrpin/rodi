package com.fluidops.rdb2rdfbench.eval;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openrdf.model.BNode;
import org.openrdf.model.Resource;
import org.openrdf.model.Value;
import org.openrdf.model.impl.ValueFactoryImpl;

/**
 * Abstract representation of a benchmark query result, i.e., with abstract
 * tuples that can be compared according to query result set equivalence (as
 * defined by the paper).
 * 
 * @author cp
 *
 */
public abstract class QueryResultSet {

	private String queryName;
	private Collection<QueryVariableSet> entityIdVars;
	private List<Value[]> tuples;

	private Map<String, Map<String, BNode>> placeHolderCache;
	private Map<Value, List<Integer>> tupleDependencyCache;

	/**
	 * To be called by re-implementation, only. Creates an empty result set.
	 * 
	 * @param queryName
	 *            Name of query.
	 * @param entityIdVars
	 *            Variable positions that need to be treated as entity
	 *            columns/URIs when adding tuples.
	 */
	protected QueryResultSet(String queryName,
			Collection<QueryVariableSet> entityIdVars) {
		this.queryName = queryName;
		this.entityIdVars = entityIdVars;
		tuples = new ArrayList<Value[]>();
		placeHolderCache = new HashMap<String, Map<String, BNode>>();
		tupleDependencyCache = new HashMap<Value, List<Integer>>();
	}

	/**
	 * Returns the query name, e.g., "Q1".
	 * 
	 * @return Query name.
	 */
	public String getQueryName() {
		return queryName;
	}

	private Map<String, BNode> getPlaceHolderCacheForColumn(String pos) {
		if (placeHolderCache.containsKey(pos))
			return placeHolderCache.get(pos);

		Map<String, BNode> ret = new HashMap<String, BNode>();
		placeHolderCache.put(pos, ret);

		return ret;
	}

	private Value getIdPlaceholder(String pos, Value val) {
		Map<String, BNode> contextCache;

		if (val instanceof Resource)
			// URIs/blank nodes are globally unique and thus fit together into
			// one (special) category, not one category per column.
			contextCache = getPlaceHolderCacheForColumn("RES");
		else
			// other values (esp., SQL keys) are relative to their column
			contextCache = getPlaceHolderCacheForColumn(pos);

		String strVal = val.stringValue();

		if (contextCache.containsKey(strVal))
			return contextCache.get(strVal);
		else {
			BNode ret = ValueFactoryImpl.getInstance().createBNode();
			contextCache.put(strVal, ret);
			tupleDependencyCache.put(ret, new ArrayList<Integer>());
			return ret;
		}
	}

	/**
	 * Adds a tuple to the result set. Will process entity IDs that may need to
	 * be substituted with place holders to support result equivalence
	 * comparisons.
	 * 
	 * @param tuple
	 *            Tuple to add.
	 */
	protected void addTuple(List<Value> tuple) {

		// tuple id: next free slot
		final int tupleNum = tuples.size();

		// copy, replace entity identifiers:
		Value[] arr = tuple.toArray(new Value[0]);
		for (QueryVariableSet qvs : entityIdVars) {
			if (qvs.isComposite()) { // case of composite IDs
				String combinedPos = null;
				String combinedValStr = null;

				for (Integer pos : qvs.getVariablePositions()) {
					if (arr.length <= pos)
						throw new RuntimeException(
								"Cannot replace ID in tuple variable " + pos
										+ " for tuple of size " + arr.length
										+ " in results of query " + queryName);

					if (combinedPos == null) {
						combinedPos += pos.toString();
						combinedValStr = arr[pos].stringValue();
					} else {
						combinedPos += "-" + pos;
						combinedValStr = "-" + arr[pos].stringValue();
					}
				}

				Value combinedVal = ValueFactoryImpl.getInstance()
						.createLiteral(combinedValStr);

				Value repl = getIdPlaceholder(combinedPos, combinedVal);

				for (Integer pos : qvs.getVariablePositions())
					arr[pos] = repl;

				tupleDependencyCache.get(repl).add(tupleNum);

			} else { // just one URI/ID column (non-composite)
				Integer pos = qvs.getVariablePosition();
				if (arr.length > qvs.getVariablePosition()) {
					Value repl = getIdPlaceholder(pos.toString(), arr[pos]);
					arr[qvs.getVariablePosition()] = repl;

					tupleDependencyCache.get(repl).add(tupleNum);
				} else
					throw new RuntimeException(
							"Cannot replace ID in tuple variable " + pos
									+ " for tuple of size " + arr.length
									+ " in results of query " + queryName);
			}
		}

		// insert tuple
		tuples.add(arr);
	}

	/**
	 * Returns the size of the result set (number of tuples).
	 * 
	 * @return Number of tuples.
	 */
	public int size() {
		return tuples.size();
	}

	/**
	 * Returns the tuple at the specified position (< {@link #size()}).
	 * 
	 * @param index
	 *            Tuple position.
	 * @return Tuple.
	 */
	public Value[] get(int index) {
		return tuples.get(index);
	}

	/**
	 * Returns a list of all tuples (as identified by their index positions)
	 * that contain and thus depend on a certain ID placeholder (blank node
	 * value).
	 * 
	 * @param node
	 *            Placeholder node.
	 * @return List of indices identifying all dependent tuples.
	 */
	public List<Integer> getDependencies(Value node) {
		return tupleDependencyCache.get(node);
	}

	/**
	 * Returns the whole result set (list of tuples).
	 * 
	 * @return Original result set as list of tuples (i.e., a reference, not a
	 *         copy).
	 */
	public List<Value[]> toList() {
		return tuples;
	}

	@Override
	public String toString() {
		return "[ Result of query '" + queryName + "' - " + tuples.size()
				+ " tuples ]";
	}
}
