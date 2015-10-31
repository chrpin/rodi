package com.fluidops.rdb2rdfbench.eval;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.openrdf.model.Value;
import org.openrdf.query.Binding;
import org.openrdf.query.BindingSet;
import org.openrdf.query.QueryEvaluationException;
import org.openrdf.query.TupleQueryResult;

/**
 * SPARQL-specific implementation of {@link QueryResultSet}s. Builds benchmark
 * result sets based on Sesame SPARQL SELECT result sets, i.e.,
 * {@link TupleQueryResult}s.
 * 
 * @author cp
 *
 */
public class SparqlResultSet extends QueryResultSet {

	/**
	 * Constructs a new instance of a {@link QueryResultSet} for SPARQL queries.
	 * 
	 * @param sparqlResult
	 *            SPARQL SELECT result as produced by the Sesame API.
	 * @param queryName
	 *            Name of the benchmark query, as usually maintained in the
	 *            {@link QueryPair}s.
	 * @param entityIdVars
	 *            Set of variables that will bind entity URIs, which need to be
	 *            matched according to the specified equivalence metrics (as
	 *            usually maintained in the {@link QueryPair})
	 * @throws QueryEvaluationException
	 *             If reading from the {@link TupleQueryResult} fails.
	 */
	public SparqlResultSet(TupleQueryResult sparqlResult, String queryName,
			Collection<QueryVariableSet> entityIdVars)
			throws QueryEvaluationException {
		super(queryName, entityIdVars);

		List<String> names = sparqlResult.getBindingNames();

		while (sparqlResult.hasNext()) {
			BindingSet bs = sparqlResult.next();
			List<Value> tuple = new ArrayList<Value>();

			for (String name : names) {
				Binding binding = bs.getBinding(name);
				tuple.add(binding != null ? binding.getValue() : null);
			}

			addTuple(tuple);
		}
	}

}
