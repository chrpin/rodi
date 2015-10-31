package com.fluidops.rdb2rdfbench.util;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.coode.owlapi.turtle.TurtleOntologyFormat;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.io.IRIDocumentSource;
import org.semanticweb.owlapi.io.OWLOntologyDocumentSource;
import org.semanticweb.owlapi.io.OWLXMLOntologyFormat;
import org.semanticweb.owlapi.model.IRI;
import org.semanticweb.owlapi.model.OWLAnnotation;
import org.semanticweb.owlapi.model.OWLAnnotationProperty;
import org.semanticweb.owlapi.model.OWLDataFactory;
import org.semanticweb.owlapi.model.OWLEntity;
import org.semanticweb.owlapi.model.OWLException;
import org.semanticweb.owlapi.model.OWLLiteral;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyChange;
import org.semanticweb.owlapi.model.OWLOntologyChangeListener;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;
import org.semanticweb.owlapi.model.OWLOntologyFormat;
import org.semanticweb.owlapi.model.OWLOntologyLoaderConfiguration;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.model.OWLOntologyStorageException;
import org.semanticweb.owlapi.model.UnknownOWLOntologyException;
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory;
import org.semanticweb.owlapi.util.SimpleIRIShortFormProvider;
import org.semanticweb.owlapi.vocab.OWLRDFVocabulary;
import org.semanticweb.owlapi.vocab.PrefixOWLOntologyFormat;

public class OntoUtil {
	
	private static OWLReasonerFactory reasonerFactory;
	private static OWLDataFactory dataFactory = OWLManager.getOWLDataFactory();
	private static LinkedList<OWLOntologyManager> managers = new LinkedList<>();
	private static OWLAnnotationProperty rdfsLabel = 
			dataFactory.getOWLAnnotationProperty(OWLRDFVocabulary.RDFS_LABEL.getIRI());
	private static SimpleIRIShortFormProvider shortFormProvider = new SimpleIRIShortFormProvider();
	
	static {
		getManager(true);
	}
	
	public static String getIRIShortFragment(String iri) {
		return shortFormProvider.getShortForm(IRI.create(iri));
	}

	public static String getIRIShortFragment(IRI iri) {
		return getIRIShortFragment(iri.toString());
	}

	public static OWLOntologyManager getManager(boolean createNew) {
		if (createNew) {
			managers.add(OWLManager.createOWLOntologyManager(dataFactory));
			managers.getLast().addOntologyChangeListener(
					new OWLOntologyChangeListener() {
						@Override
						public void ontologiesChanged(
								List<? extends OWLOntologyChange> arg0)
										throws OWLException {
						}
					});

		}
		return managers.getLast();
	}
	
	static public void unloadAllOntologies(OWLOntologyManager manager) {
		Iterator<OWLOntology> itr = manager.getOntologies().iterator();
		OWLOntology o = null;

		while (itr.hasNext()) {
			o = itr.next();
			manager.removeOntology(o);
		}
	}
	
	public static void unloadAllOntologies() {
		for (OWLOntologyManager manager : managers)
			unloadAllOntologies(manager);
	}

	public static void unloadOntologies(boolean all, OWLOntology... ontos) {
		if (!all)
			unloadOntologies(ontos);

		try {
			for (OWLOntologyManager manager : managers)
				for (OWLOntology o : ontos)
					if (manager.contains(o.getOntologyID().getOntologyIRI()))
						manager.removeOntology(o);
		} catch (UnknownOWLOntologyException e) {
			e.printStackTrace();
		}
	}

	public static void unloadOntologies(OWLOntologyManager manager,
			OWLOntology... ontos) {
		try {
			for (OWLOntology o : ontos)
				if (manager.contains(o.getOntologyID().getOntologyIRI()))
					manager.removeOntology(o);
		} catch (UnknownOWLOntologyException e) {
			e.printStackTrace();
		}
	}

	public static void unloadOntologies(OWLOntology... ontos) {
		try {
			for (OWLOntology o : ontos)
				if (getManager(false).contains(
						o.getOntologyID().getOntologyIRI()))
					getManager(false).removeOntology(o);
		} catch (UnknownOWLOntologyException e) {
			e.printStackTrace();
		}
	}
	
	static public OWLOntology load(String iriString, boolean local,
			OWLOntologyManager manager) throws OWLOntologyCreationException {
		OWLOntologyLoaderConfiguration config = new OWLOntologyLoaderConfiguration();
		config = config.setLoadAnnotationAxioms(true);
		
		IRI iri = null;
		if (!local)
			iri = IRI.create(iriString);
		else
			iri = IRI.create(new File(iriString));

		OWLOntologyDocumentSource source = new IRIDocumentSource(iri);
		return manager.loadOntologyFromOntologyDocument(source, config);
	}
	
	static public void save(OWLOntology onto, String destFile,
			OWLOntologyManager manager, OWLOntologyFormat outFormat) throws 
			OWLOntologyStorageException, OWLOntologyCreationException, IOException {

		File file = new File(destFile);
		// manager.saveOntology(onto, IRI.create(file.toURI()));
		// By default ontologies are saved in the format from which they were
		// loaded. In this case the ontology was loaded from an rdf/xml file We
		// can get information about the format of an ontology from its manager

		OWLOntologyFormat format = manager.getOntologyFormat(onto);
		
		// Some ontology formats support prefix names and prefix IRIs. In our
		// case we loaded the pizza ontology from an rdf/xml format, which
		// supports prefixes. When we save the ontology in the new format we
		// will copy the prefixes over so that we have nicely abbreviated IRIs
		// in the new ontology document
		if (format.isPrefixOWLOntologyFormat() && outFormat.isPrefixOWLOntologyFormat()) {
			((PrefixOWLOntologyFormat) outFormat).copyPrefixesFrom(format.asPrefixOWLOntologyFormat());
		}
		manager.saveOntology(onto, outFormat, IRI.create(file.toURI()));

	}
	
	static public void save(OWLOntology onto, String destFile,
			OWLOntologyManager manager) throws OWLOntologyStorageException,
			OWLOntologyCreationException, IOException {
		save(onto,destFile,manager,manager.getOntologyFormat(onto));
	}

	static public void saveAsOWLXML(OWLOntology onto, String destFile,
			OWLOntologyManager manager) throws OWLOntologyStorageException,
			OWLOntologyCreationException, IOException {
		// We can save the ontology in a different format Lets save the ontology
		// in owl/xml format
		save(onto,destFile,manager,new OWLXMLOntologyFormat());
	}

	public static OWLEntity getEntityFromLabel(OWLOntology o, String label){
				
		for (OWLEntity e : o.getSignature()) {
			if(e.isOWLClass() || e.isOWLDataProperty() || e.isOWLObjectProperty()){
				for (OWLAnnotation annotation : e.getAnnotations(o, rdfsLabel)) {
		            if (annotation.getValue() instanceof OWLLiteral) {
		                OWLLiteral val = (OWLLiteral) annotation.getValue();
		                if(val.getLiteral().equals(label))
		                	return e;
	//	                if (val.hasLang("en")) {
	//	                    System.out.println(cls + " -> " + val.getLiteral());
	//	                }
		            }
		        }
			}
		}
		
		return null;
	}
	
	public static OWLEntity getEntityFromName(OWLOntology o, String label){
		
		for (OWLEntity e : o.getSignature()) {
			if(e.isOWLClass() || e.isOWLDataProperty() || e.isOWLObjectProperty()){
				if(label.equals(getIRIShortFragment(e.getIRI())))
					return e;
			}
		}
		
		return null;
	}
}
