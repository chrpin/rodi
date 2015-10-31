package com.fluidops.rdb2rdfbench.eval;

import java.util.HashMap;
import java.util.Map;

/**
 * Represents a mapping between query result tuple, based on a {@link HashMap}.
 * Each column or variable is identified by its position in the tuple (0, 1,
 * ...). Corresponding columns/variables are thus mapped integer to integer.
 * 
 * @author cp
 *
 */
public class QueryMapping extends HashMap<Integer, Integer> {

	private static final long serialVersionUID = 1L;

	/**
	 * Creates a default mapping between tuples of size k (tuples with k values
	 * in each tuple). In a default mapping, each left hand variable or column
	 * maps to the same variable or column on the right hand side, i.e., 0/0,
	 * 1/1, 2/2, ..., k-1/k-1 (as in "SELECT A, B, C ..." and
	 * "SELECT ?A ?B ?C ...").
	 * 
	 * @param k
	 *            Number of values per tuple.
	 */
	public QueryMapping(int k) {
		for (int i = 0; i < k; i++)
			put(i, i);
	}

	/**
	 * Just as in {@link QueryVariableSet}s, columns and variables are
	 * identified by their positions in the tuple.
	 * 
	 * @param mapping
	 */
	public QueryMapping(Map<Integer, Integer> mapping) {
		putAll(mapping);
	}
}
