package com.fluidops.rdb2rdfbench.eval;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.openrdf.model.Value;
import org.openrdf.model.impl.ValueFactoryImpl;
import org.openrdf.model.vocabulary.XMLSchema;

import static java.sql.Types.*;

/**
 * SQL-specific implementation of {@link QueryResultSet}s. Builds benchmark
 * result sets based on JDBC SQL result sets.
 * 
 * @author cp
 *
 */
public class SqlResultSet extends QueryResultSet {

	/**
	 * Constructor. Creates a new SQL result set.
	 * 
	 * @param res
	 *            SQL result set.
	 * @param queryName
	 *            Name of benchmark query (as maintained in the
	 *            {@link QueryPair})
	 * @param entityIdVars
	 *            Set of columns that will bind entity IDs, which need to be
	 *            matched according to the specified equivalence metrics (as
	 *            usually maintained in the {@link QueryPair})
	 * @throws SQLException
	 *             On errors on evaluation of result set.
	 */
	public SqlResultSet(ResultSet res, String queryName,
			Collection<QueryVariableSet> entityIdVars) throws SQLException {
		super(queryName, entityIdVars);

		ResultSetMetaData meta = res.getMetaData();
		int cols = meta.getColumnCount();

		while (res.next()) {
			List<Value> tuple = new ArrayList<Value>();

			for (int i = 1; i <= cols; i++) {
				switch (meta.getColumnType(i)) {
				case INTEGER:
				case BIGINT:
				case SMALLINT:
				case TINYINT:
					tuple.add(res.getString(i) != null ? ValueFactoryImpl
							.getInstance().createLiteral(res.getString(i),
									XMLSchema.INTEGER) : null);
					break;

				case FLOAT:
				case DOUBLE:
				case DECIMAL:
				case NUMERIC:
				case REAL:
					tuple.add(res.getString(i) != null ? ValueFactoryImpl
							.getInstance().createLiteral(res.getString(i),
									XMLSchema.DECIMAL) : null);
					break;

				case TIMESTAMP:
					tuple.add(res.getString(i) != null ? ValueFactoryImpl
							.getInstance().createLiteral(res.getString(i),
									XMLSchema.DATETIME) : null);
					break;

				case DATE:
					tuple.add(res.getString(i) != null ? ValueFactoryImpl
							.getInstance().createLiteral(res.getString(i),
									XMLSchema.DATE) : null);
					break;

				case TIME:
					tuple.add(res.getString(i) != null ? ValueFactoryImpl
							.getInstance().createLiteral(res.getString(i),
									XMLSchema.TIME) : null);
					break;

				default: // string
					tuple.add(res.getString(i) != null ? ValueFactoryImpl
							.getInstance().createLiteral(res.getString(i))
							: null);
				}
			}

			addTuple(tuple);
		}
	}
}
