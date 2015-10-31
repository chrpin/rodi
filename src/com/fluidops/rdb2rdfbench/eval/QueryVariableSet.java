package com.fluidops.rdb2rdfbench.eval;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/**
 * Helper class. Represents a set of one or more variables or columns in a
 * query result tuple, each identified by their position in the tuple (e.g.,
 * 0 for the first selected value).
 * 
 * @author cp
 *
 */
public class QueryVariableSet extends HashSet<Integer> {

	private static final long serialVersionUID = 1L;

	/**
	 * Constructs a {@link QueryVariableSet} of one or more variables.
	 * 
	 * @param variableNums
	 *            Numbers (positions in tuple) of variable(s) to be
	 *            specified by this set.
	 */
	public QueryVariableSet(Integer... variableNums) {
		for (Integer variableNum : variableNums)
			add(variableNum);
	}

	/**
	 * Checks if this set is valid, i.e., if it specifies one or more
	 * variables (columns) in a tuple.
	 * 
	 * @return Initialization status.
	 */
	public boolean isValid() {
		return (size() > 0);
	}

	/**
	 * Checks whether the set describes a composite identifier, i.e.,
	 * specifies several variables at once.
	 * 
	 * @return True if this set describes a composite key, else false.
	 */
	public boolean isComposite() {
		return (size() > 1);
	}

	/**
	 * Returns the position of the single variable (column) that specifies
	 * the identifier described by this set. Throws exceptions on composite
	 * identifiers.
	 * 
	 * @return Variable or column position.
	 */
	public Integer getVariablePosition() {
		if (!isValid())
			throw new RuntimeException(
					"Error: QueryVariableSet is invalid (empty set).");
		else if (isComposite())
			throw new RuntimeException(
					"Cannot return single variable number in composite key (several columns).");
		else
			return iterator().next();
	}

	/**
	 * Returns the positions of variables (columns) that specify the
	 * identifier described by this set. For non-composite identifiers the
	 * list is of length one, and {@link #getVariablePosition()} is the
	 * preferred method to be used instead.
	 * 
	 * @return Variable or column position.
	 */
	public List<Integer> getVariablePositions() {
		ArrayList<Integer> ret = new ArrayList<Integer>();
		ret.addAll(this);
		Collections.sort(ret);
		return ret;
	}
}