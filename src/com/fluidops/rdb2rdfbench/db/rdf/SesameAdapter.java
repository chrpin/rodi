package com.fluidops.rdb2rdfbench.db.rdf;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import org.openrdf.model.Statement;
import org.openrdf.model.impl.ValueFactoryImpl;
import org.openrdf.query.BindingSet;
import org.openrdf.query.GraphQuery;
import org.openrdf.query.MalformedQueryException;
import org.openrdf.query.QueryEvaluationException;
import org.openrdf.query.QueryLanguage;
import org.openrdf.query.TupleQuery;
import org.openrdf.query.TupleQueryResult;
import org.openrdf.query.Update;
import org.openrdf.query.UpdateExecutionException;
import org.openrdf.repository.Repository;
import org.openrdf.repository.RepositoryConnection;
import org.openrdf.repository.RepositoryException;
import org.openrdf.repository.RepositoryResult;
import org.openrdf.repository.sail.SailRepository;
import org.openrdf.rio.RDFFormat;
import org.openrdf.rio.RDFHandler;
import org.openrdf.rio.RDFHandlerException;
import org.openrdf.rio.RDFParseException;
import org.openrdf.rio.RDFWriter;
import org.openrdf.rio.Rio;
import org.openrdf.rio.rdfxml.RDFXMLWriter;
import org.openrdf.sail.SailException;
import org.openrdf.sail.memory.MemoryStore;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.io.RDFXMLOntologyFormat;
import org.semanticweb.owlapi.io.ReaderDocumentSource;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.model.OWLOntologyStorageException;

import com.fluidops.rdb2rdfbench.eval.QueryPair;
import com.fluidops.rdb2rdfbench.eval.SparqlResultSet;

/**
 * One-stop shop for all Sesame database operations. Manages {@link MemoryStore}
 * repositories, and connections, provides utility methods for relevant access
 * methods.
 * 
 * @author cp
 *
 */
public class SesameAdapter {

	private static final Integer lock = 0;
	private static SesameAdapter mainMe;
	private static SesameAdapter evaluationMe;

	private Repository repo;

	/**
	 * Type of repository, which can be MAIN (input and operations) or
	 * EVALUATION (repository to temporarily keeping materialized mapping
	 * results for evaluation)
	 * 
	 * @author cp
	 *
	 */
	public enum RepoType {
		MAIN, EVALUATION
	}

	private SesameAdapter(String backupDir) throws RepositoryException {
		MemoryStore mems = new MemoryStore(new File(backupDir));
		try {
			mems.initialize();
		} catch (SailException e) {
			throw new RuntimeException("Failed to initialize Sesame store on "
					+ backupDir);
		}

		repo = new SailRepository(mems);

		if (!repo.isWritable())
			throw new RuntimeException(
					"Failed to create Sesame repository as writable, "
							+ "backed up on " + backupDir
							+ ". Full reset may be required.");
	}

	/**
	 * "Dualton" instance retriever. Creates and/or returns one of two available
	 * singleton-style instances, one for each {@link RepoType}.
	 * 
	 * @param type
	 *            Requested repository type.
	 * @return Singleton-style object.
	 * @throws RepositoryException
	 *             If creation/initialization fails.
	 */
	public static SesameAdapter getInstance(RepoType type)
			throws RepositoryException {

		switch (type) {
		case MAIN:
			synchronized (lock) {
				if (mainMe == null)
					mainMe = new SesameAdapter("./sesame_db/main/");
			}
			return mainMe;

		case EVALUATION:
			synchronized (lock) {
				if (evaluationMe == null)
					evaluationMe = new SesameAdapter("./sesame_db/eval/");
			}
			return evaluationMe;

		default:
			throw new RuntimeException("Illegal repository type.");
		}
	}

	/**
	 * Resets all repositories. Cleans all, repositories, shuts them down and
	 * will cause new {@link SesameAdapter} instances to be retrieved on
	 * subsequent calls to {@link #getInstance(RepoType)}.
	 * 
	 * @throws RepositoryException
	 *             On shutdown errors.
	 */
	public static void reset() throws RepositoryException {
		synchronized (lock) {

			if (mainMe == null)
				mainMe = new SesameAdapter("./sesame_db/main/");
			mainMe.cleanup();
			mainMe.getRepository().shutDown();
			mainMe = null;

			if (evaluationMe == null)
				evaluationMe = new SesameAdapter("./sesame_db/eval/");
			evaluationMe.cleanup();
			evaluationMe.getRepository().shutDown();
			evaluationMe = null;
		}
	}

	/**
	 * Cleanly shuts down all repositories and causes new {@link SesameAdapter}
	 * instances to be retrieved on subsequent calls to
	 * {@link #getInstance(RepoType)}.
	 * 
	 * @throws RepositoryException
	 *             On shutdown errors.
	 */
	public static void shutdown() throws RepositoryException {
		synchronized (lock) {

			if (mainMe != null) {
				mainMe.getRepository().shutDown();
				mainMe = null;
			}

			if (evaluationMe != null) {
				evaluationMe.getRepository().shutDown();
				evaluationMe = null;
			}
		}
	}

	/**
	 * Removes all data from the repository.
	 * 
	 * @throws RepositoryException
	 *             If cleanup fails.
	 */
	public void cleanup() throws RepositoryException {
		repo.getConnection().clear();
	}

	/**
	 * Copies all data from the main repository into the evaluation repository.
	 * Note, that this will not remove any data already in the evaluation
	 * repository.
	 * 
	 * @throws RepositoryException
	 */
	public static void transfer() throws RepositoryException {
		RepositoryConnection conn = getInstance(RepoType.EVALUATION)
				.getRepository().getConnection();
		RepositoryResult<Statement> mainDbStmts = getInstance(RepoType.MAIN)
				.getRepository().getConnection()
				.getStatements(null, null, null, false);
		conn.add(mainDbStmts);
	}

	/**
	 * Loads RDF contents from the specified file into the repository.
	 * 
	 * @param filePath
	 *            Path to data file.
	 * @throws RepositoryException
	 *             If no connection could be established.
	 */
	public void loadFromFile(String filePath) throws RepositoryException {
		RepositoryConnection conn = repo.getConnection();
		try {
			conn.add(
					new File(filePath),
					null,
					RDFFormat.forFileName(filePath),
					ValueFactoryImpl.getInstance().createURI(
							"urn:defaultContext"));
		} catch (RDFParseException | IOException e) {
			throw new RuntimeException(e);
		} finally {
			conn.close();
		}
	}

	/**
	 * Exports all data into the specified file (as RDF/XML).
	 * 
	 * @param filePath
	 *            Path to file.
	 * @throws RepositoryException
	 * @throws FileNotFoundException
	 */
	public void exportToFile(String filePath) throws RepositoryException,
			FileNotFoundException {
		OutputStream fileStream = new FileOutputStream(new File(filePath));
		RDFWriter writer = Rio.createWriter(
				RDFFormat.forFileName(filePath, RDFFormat.RDFXML), fileStream);

		RepositoryConnection conn = repo.getConnection();

		try {
			conn.export(writer);
		} catch (RDFHandlerException e) {
			throw new RuntimeException("Error during export: " + e);
		} finally {
			conn.close();
		}
	}

	/**
	 * Loads contents from OWL API, converting via serialized RDF.
	 * 
	 * @param onto
	 *            OWL ontology.
	 * 
	 * @throws RepositoryException
	 *             If no connection could be established.
	 * @throws OWLOntologyStorageException
	 *             If OWL API throws errors when requested to output data as
	 *             RDF.
	 */
	public void loadFromOwl(OWLOntology onto) throws RepositoryException,
			OWLOntologyStorageException {
		OWLOntologyManager mgr = OWLManager.createOWLOntologyManager();
		ByteArrayOutputStream out = new ByteArrayOutputStream(512 * 1024);
		mgr.saveOntology(onto, new RDFXMLOntologyFormat(), out);
		InputStream in = new ByteArrayInputStream(out.toByteArray());

		RepositoryConnection conn = repo.getConnection();
		try {
			conn.add(in, "urn:defaultContext", RDFFormat.RDFXML);
		} catch (RDFParseException | IOException e) {
			throw new RuntimeException(e);
		} finally {
			conn.close();
		}
	}

	/**
	 * Exports all data into an OWL API ontology.
	 * 
	 * @return OWL ontology.
	 * @throws RepositoryException
	 * @throws MalformedQueryException
	 * @throws QueryEvaluationException
	 * @throws RDFHandlerException
	 * @throws OWLOntologyCreationException
	 */
	public OWLOntology exportToOwl() throws RepositoryException,
			MalformedQueryException, QueryEvaluationException,
			RDFHandlerException, OWLOntologyCreationException {

		RepositoryConnection conn = SesameAdapter
				.getInstance(RepoType.EVALUATION).getRepository()
				.getConnection();

		GraphQuery query = conn.prepareGraphQuery(QueryLanguage.SPARQL,
				"CONSTRUCT {?s ?p ?o} WHERE {?s ?p ?o}");

		query.evaluate();

		StringWriter strWriter = new StringWriter();
		RDFHandler writer = new RDFXMLWriter(strWriter);

		query.evaluate(writer);
		strWriter.flush();
		StringBuffer buffer = strWriter.getBuffer();

		OWLOntology o = OWLManager.createOWLOntologyManager()
				.loadOntologyFromOntologyDocument(
						new ReaderDocumentSource(new StringReader(buffer
								.toString())));

		conn.close();

		return o;
	}

	/**
	 * Adds the specified statements to the repository.
	 * 
	 * @param stmts
	 *            RDF statements to add.
	 * @throws RepositoryException
	 *             If no connection could be established.
	 */
	public void add(List<Statement> stmts) throws RepositoryException {
		getRepository().getConnection().add(stmts);
	}

	/**
	 * Evaluates the SPARQL SELECT query from the specified query pair on the
	 * repository.
	 * 
	 * @param query
	 *            Query pair.
	 * @return Query result set.
	 * @throws RepositoryException
	 *             If no connection could be established, or connection fails.
	 * @throws MalformedQueryException
	 *             On query-related errors.
	 * @throws QueryEvaluationException
	 *             On query-related errors.
	 */
	public SparqlResultSet query(QueryPair query) throws RepositoryException,
			MalformedQueryException, QueryEvaluationException {
		RepositoryConnection conn = repo.getConnection();
		TupleQuery tq = conn.prepareTupleQuery(QueryLanguage.SPARQL,
				query.getSparqlQuery());
		SparqlResultSet ret = new SparqlResultSet(tq.evaluate(),
				query.getName(), query.getSparqlEntityIdVariables());
		conn.close();

		return ret;
	}

	/**
	 * Runs a SPARQL SELECT query (specified by a query string) on the
	 * repository.
	 * 
	 * @param sparqlString
	 *            SELECT query.
	 * @return Sesame tuple query result set.
	 * @throws RepositoryException
	 *             If no connection could be established or connection fails.
	 * @throws MalformedQueryException
	 *             On query-related errors.
	 * @throws QueryEvaluationException
	 *             On query-related errors.
	 */
	public List<BindingSet> plainSparqlQuery(String sparqlString)
			throws RepositoryException, MalformedQueryException,
			QueryEvaluationException {

		RepositoryConnection conn = repo.getConnection();

		TupleQuery query = conn.prepareTupleQuery(QueryLanguage.SPARQL,
				sparqlString);

		List<BindingSet> ret = new ArrayList<BindingSet>();
		TupleQueryResult res = query.evaluate();
		while (res.hasNext())
			ret.add(res.next());

		conn.close();
		return ret;
	}

	/**
	 * Runs a SPARQL UPDATE query as specified.
	 * 
	 * @param sparqlString
	 *            Query string.
	 * @throws RepositoryException
	 * @throws MalformedQueryException
	 * @throws QueryEvaluationException
	 * @throws UpdateExecutionException
	 */
	public void plainSparqlUpdate(String sparqlString)
			throws RepositoryException, MalformedQueryException,
			QueryEvaluationException, UpdateExecutionException {

		RepositoryConnection conn = repo.getConnection();

		Update query = conn.prepareUpdate(QueryLanguage.SPARQL, sparqlString);

		query.execute();

		conn.close();
	}

	/**
	 * Returns the plain Sesame repository of the object.
	 * 
	 * @return Repository.
	 */
	public Repository getRepository() {
		return repo;
	}
}
