package com.fluidops.rdb2rdfbench.eval;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * Representation of a pair of corresponding SQL/SPARQL queries in the context
 * of the benchmark, i.e., named queries with additional information about
 * variables/columns that will contain entity IDs (database keys or URIs).
 * 
 * @author cp
 *
 */
public class QueryPair {

	/**
	 * Query name.
	 */
	protected String name;
	
	/**
	 * File name (without suffix)
	 */
	protected String fileNameBase;

	/**
	 * Query string (SQL)
	 */
	protected String sqlQuery;

	/**
	 * Query string (SPARQL)
	 */
	protected String sparqlQuery;

	/**
	 * Set of all column positions in SQL results (e.g., 0 for first value in
	 * each tuple) that contain entity IDs (keys) and need to be matched using
	 * our defined equivalence measure. Several columns may combine as a
	 * composite key. This is why each entry is a set of (possibly) more than
	 * one variable.
	 */
	protected Collection<QueryVariableSet> entityIdColumns;

	/**
	 * Set of all variable positions in SPARQL SELECT results (e.g., 0 for first
	 * variable in each tuple) that contain entity URIs and need to be matched
	 * using our defined equivalence measure. As there are no composite keys in
	 * RDF, all {@link QueryVariableSet}s are of size one.
	 */
	protected Collection<QueryVariableSet> entityUriVariables;

	/**
	 * Query result mapping, specifying corresponding columns and variables in
	 * the SQL and SPARQL result tuples, respectively.
	 */
	protected QueryMapping mapping;

	/**
	 * Set of category IDs (or group tags) used for aggregation grouping during
	 * evaluation.
	 */
	protected Set<String> categories;

	protected boolean disabled;

	/**
	 * Constructor. Builds a query pair without any specification of entity
	 * identifiers or query mappings. Entity identifiers (entity keys/URIs) in
	 * the query results would need to be matched using a dedicated equivalence
	 * metrics and must thus be specified explicitly. To do so, use
	 * {@link #addSqlEntityIdColumn(Integer...)} and
	 * {@link #addSparqlEntityIdColumn(int)}, respectively. Unless a query
	 * mapping is specified later, a default mapping is assumed.
	 * 
	 * @param fileNameBase
	 *            File name base part (main name, without path and suffix)
	 * @param name
	 *            Query name, e.g., "Q1"
	 * @param sqlQuery
	 *            SQL query string.
	 * @param sparqlQuery
	 *            SPARQL SELECT query string.
	 * @param categories
	 *            Set of category IDs (or group tags) that this query pair
	 *            belongs to.
	 */
	public QueryPair(String fileNameBase, String name, String sqlQuery, String sparqlQuery, Set<String> categories) {
		this.fileNameBase = fileNameBase;
		this.name = name;
		this.sqlQuery = sqlQuery;
		this.sparqlQuery = sparqlQuery;
		this.categories = categories;

		entityIdColumns = new HashSet<QueryVariableSet>();
		entityUriVariables = new HashSet<QueryVariableSet>();
		mapping = null;
		disabled = false;
	}

	/**
	 * Returns the main name part (without path and suffix) of the original
	 * .qpair file.
	 * 
	 * @return File name part.
	 */
	public String getFileNameBase() {
		return fileNameBase;
	}
	
	/**
	 * Retrieves the query name, e.g., "Q1".
	 * 
	 * @return Query name.
	 */
	public String getName() {
		return name;
	}

	/**
	 * Returns a list of category IDs ("group tags") that this query pair
	 * belongs to. Categories are used to generate different aggregations over
	 * groups of similar queries during evaluation.
	 * 
	 * @return Category IDs.
	 */
	public Set<String> getCategories() {
		return categories;
	}

	/**
	 * Returns the query string of the SQL query.
	 * 
	 * @return SQL query.
	 */
	public String getSqlQuery() {
		return sqlQuery;
	}

	/**
	 * Returns the query string of the SPARQL query.
	 * 
	 * @return SPARQL query.
	 */
	public String getSparqlQuery() {
		return sparqlQuery;
	}

	/**
	 * Returns the position of any columns in the SQL query result that will
	 * contain entity identifiers. As some identifiers may be composite keys,
	 * some {@link QueryVariableSet} may specify more than one column. For
	 * non-composite identifiers, {@link QueryVariableSet}s contain only one
	 * column, each (i.e., the one that contains the identifying key).
	 * 
	 * @return Columns that contain IDs.
	 */
	public Collection<QueryVariableSet> getSqlEntityIdColumns() {
		return entityIdColumns;
	}

	/**
	 * Specifies a column in the result set of the SQL query (or several
	 * columns, for composite keys), that will contain IDs of entities and thus
	 * need to be matched with entity URIs based on the equivalence metric from
	 * the paper.
	 * 
	 * @param pos
	 *            Position of entity key in query result tuple.
	 */
	public void addSqlEntityIdColumn(Integer... pos) {
		entityIdColumns.add(new QueryVariableSet(pos));
	}

	/**
	 * Returns the position of any variables in the SPARQL SELECT query result
	 * that will contain entity URIs. As URIs are unique identifiers by
	 * definition, IDs never need to be composed from several URIs and thus
	 * {@link QueryVariableSet}s contain only one variable, each (i.e., the one
	 * that binds the entity URIs).
	 * 
	 * @return Columns that contain IDs.
	 */
	public Collection<QueryVariableSet> getSparqlEntityIdVariables() {
		return entityUriVariables;
	}

	/**
	 * Specifies a variable in the result set of the SPARQL SELECT query that
	 * will contain entity URIs that need to be matched with specific ID columns
	 * of the corresponding SQL result.
	 * 
	 * @param pos
	 *            Position of entity key in query result tuple.
	 */
	public void addSparqlEntityIdColumn(int pos) {
		entityUriVariables.add(new QueryVariableSet(pos));
	}

	/**
	 * Returns the {@link QueryMapping} of corresponding columns in query
	 * results between SQL and SPARQL SELECT tuples, respectively. Returns null
	 * if no mapping is specified. When evaluating, a default mapping (see
	 * {@link QueryMapping#QueryMapping(int)}) is assumed in the absence of an
	 * explicit mapping.
	 * 
	 * @return Query mapping, or null (for default).
	 */
	public QueryMapping getQueryMapping() {
		return mapping;
	}

	/**
	 * Explicitly sets a query mapping. If no query mapping is set, a default
	 * will be assumed.
	 * 
	 * @param mapping
	 *            Mapping column/variable mapping.
	 */
	public void setQueryMapping(QueryMapping mapping) {
		this.mapping = mapping;
	}

	/**
	 * Marks the query pair as disabled (i.e., should not be evaluated).
	 */
	public void disable() {
		this.disabled = true;
	}

	/**
	 * Returns whether this query pair has been disabled (i.e., should not be
	 * evaluated).
	 * 
	 * @return True, if disabled, otherwise false.
	 */
	public boolean isDisabled() {
		return disabled;
	}

}
