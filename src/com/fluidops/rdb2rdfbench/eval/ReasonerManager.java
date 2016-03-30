package com.fluidops.rdb2rdfbench.eval;

import java.net.URL;
import java.util.HashSet;
import java.util.Set;

import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.OWLAxiom;
import org.semanticweb.owlapi.model.OWLDataPropertyAssertionAxiom;
import org.semanticweb.owlapi.model.OWLDataPropertyExpression;
import org.semanticweb.owlapi.model.OWLEquivalentDataPropertiesAxiom;
import org.semanticweb.owlapi.model.OWLNamedIndividual;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.owllink.OWLlinkHTTPXMLReasonerFactory;
import org.semanticweb.owlapi.owllink.OWLlinkReasonerConfiguration;
import org.semanticweb.owlapi.reasoner.OWLReasoner;


public class ReasonerManager {

	public enum REASONER { OWLLINK, STRUCTURAL}
	
	public static OWLReasoner getReasoner(OWLOntology onto){
		return getReasoner(REASONER.STRUCTURAL, onto); //default reasoner
	}
	
	public static OWLReasoner getReasoner(REASONER reasoner, OWLOntology onto){
		
		if (reasoner.equals(REASONER.OWLLINK))
			return getOWLLinkReasoner(onto);		
		else if (reasoner.equals(REASONER.STRUCTURAL))
			return getStructuralReasoner(onto);		
		else 
			return getStructuralReasoner(onto);
		
	}
	
	
	
	private static OWLReasoner getOWLLinkReasoner(OWLOntology onto){
		try{
				
			Set<OWLAxiom> axioms = new HashSet<OWLAxiom>();
			axioms.addAll(onto.getRBoxAxioms(true));
			axioms.addAll(onto.getABoxAxioms(true));
			axioms.addAll(onto.getTBoxAxioms(true));
			
			//Give logical axioms only...
			OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
			OWLOntology logical_onto = OWLManager.createOWLOntologyManager().createOntology(axioms);
			
			
			//Avoid types in dataproperty assertions... (the R2RML to Triple Engine creates "wrong" types)
			Set<OWLAxiom> toAdd = new HashSet<OWLAxiom>();
			Set<OWLAxiom> toDel = new HashSet<OWLAxiom>();
			
			for (OWLNamedIndividual ind : logical_onto.getIndividualsInSignature(true)){
				
				for (OWLDataPropertyAssertionAxiom ax : logical_onto.getDataPropertyAssertionAxioms(ind)){					
					toAdd.add(manager.getOWLDataFactory().getOWLDataPropertyAssertionAxiom(ax.getProperty(), ind, ax.getObject()));	
					toDel.add(ax);
				}
			}
			manager.addAxioms(logical_onto, toAdd);
			manager.removeAxioms(logical_onto, toDel);
			
			
			//manager.saveOntology(logical_onto, new RDFXMLOntologyFormat(), IRI.create("file:/home/ernesto/workspace_juno/bench_framework/morph/cmt_renamed_mysql/onto_data.owl"));
			
			
			
			// configure the server end-point
			URL url = new URL("http://localhost:8080");
			OWLlinkReasonerConfiguration reasonerConfiguration =
				new OWLlinkReasonerConfiguration(url);
			
			OWLlinkHTTPXMLReasonerFactory factory = new OWLlinkHTTPXMLReasonerFactory();
		 	//return factory.createNonBufferingReasoner(onto, reasonerConfiguration);
		 	return factory.createReasoner(logical_onto, reasonerConfiguration);
		}
		catch(Exception e){
			System.err.println("Error connecting to OWLlink Reasoner");
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
	private static OWLReasoner getStructuralReasoner(OWLOntology onto) {
		try{
			
			Set<OWLAxiom> axioms = new HashSet<OWLAxiom>();
			axioms.addAll(onto.getRBoxAxioms(true));
			axioms.addAll(onto.getABoxAxioms(true));
			axioms.addAll(onto.getTBoxAxioms(true));
			
			//Give logical axioms only...
			OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
			OWLOntology logical_onto = OWLManager.createOWLOntologyManager().createOntology(axioms);
			
			
			//Avoid types in dataproperty assertions... (the R2RML to Triple Engine creates "wrong" types)
			Set<OWLAxiom> toAdd = new HashSet<OWLAxiom>();
			Set<OWLAxiom> toDel = new HashSet<OWLAxiom>();
			
			for (OWLNamedIndividual ind : logical_onto.getIndividualsInSignature(true)){				
				for (OWLDataPropertyAssertionAxiom ax : logical_onto.getDataPropertyAssertionAxioms(ind)){
					
					toAdd.add(manager.getOWLDataFactory().getOWLDataPropertyAssertionAxiom(ax.getProperty(), ind, ax.getObject()));
					
					if (!ax.getProperty().isAnonymous()){
						for (OWLEquivalentDataPropertiesAxiom equiv_prop_ax : logical_onto.getEquivalentDataPropertiesAxioms(ax.getProperty().asOWLDataProperty())){
							for (OWLDataPropertyExpression equiv_data_prop : equiv_prop_ax.getProperties()){
								if (!equiv_data_prop.isAnonymous()){
									toAdd.add(manager.getOWLDataFactory().getOWLDataPropertyAssertionAxiom(equiv_data_prop, ind, ax.getObject()));
								}
							}
						}
					}
					toDel.add(ax);					
				}
			}
			manager.applyChanges(manager.addAxioms(logical_onto, toAdd));
			manager.applyChanges(manager.removeAxioms(logical_onto, toDel));
			
			
			System.out.println("\t...using Structural reasoner...");
			return new StructuralReasonerExtended(logical_onto);
		}
		catch(Exception e){
			System.err.println("Error reasoning with Structural reasoner");
			e.printStackTrace();
			return null;
		}
	}
	

	

}
