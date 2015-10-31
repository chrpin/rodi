package com.fluidops.rdb2rdfbench.eval;

import java.net.URL;
import java.util.HashSet;
import java.util.Set;

import org.semanticweb.HermiT.Configuration;
import org.semanticweb.HermiT.Reasoner;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.OWLAxiom;
import org.semanticweb.owlapi.model.OWLDataPropertyAssertionAxiom;
import org.semanticweb.owlapi.model.OWLNamedIndividual;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.owllink.OWLlinkHTTPXMLReasonerFactory;
import org.semanticweb.owlapi.owllink.OWLlinkReasonerConfiguration;
import org.semanticweb.owlapi.reasoner.OWLReasoner;
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory;

//import uk.ac.manchester.cs.factplusplus.owlapiv3.FaCTPlusPlusReasonerFactory;
//import com.clarkparsia.pellet.owlapiv3.PelletReasonerFactory;
//import uk.ac.manchester.cs.jfact.JFactFactory;

public class ReasonerManager {

	public enum REASONER { HERMIT, JFACT, PELLET, FACTpp, FACTppOWLlink, KONCLUDE}
	
	public static OWLReasoner getReasoner(OWLOntology onto){
		return getReasoner(REASONER.KONCLUDE, onto); //default reasoner
	}
	
	public static OWLReasoner getReasoner(REASONER reasoner, OWLOntology onto){
		
		if (reasoner.equals(REASONER.HERMIT))
			return getHermiTreasoner(onto);
		/*else if (reasoner.equals(REASONER.JFACT))
			return getJFactReasoner(onto);
		*/
		else if (reasoner.equals(REASONER.PELLET))
			return getPelletReasoner(onto);
		else if (reasoner.equals(REASONER.FACTpp))
			return getFactppReasoner(onto);
		
		else if (reasoner.equals(REASONER.FACTppOWLlink))
			return getFactppReasonerOWLLink(onto);
	
		else if (reasoner.equals(REASONER.KONCLUDE))
			return getKoncludeReasoner(onto);
		
		return null;
		
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
	
	
	
	public static OWLReasoner getKoncludeReasoner(OWLOntology onto) {
		System.out.println("\t...using Konclude...");
		return getOWLLinkReasoner(onto);
	}


	public static OWLReasoner getFactppReasonerOWLLink(OWLOntology onto) {
		System.out.println("\t...using FaCT++ (owl link)...");
		return getOWLLinkReasoner(onto);
	}
		
	public static OWLReasoner getFactppReasoner(OWLOntology onto) {
		
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
			
			//manager.saveOntology(logical_onto, new RDFXMLOntologyFormat(), IRI.create("file:/home/ernesto/workspace_juno/bench_framework/optique_boots/npd/logical_onto2.owl"));
			
			
			System.out.println("\t...using FaCT++...");
				
		//	FaCTPlusPlusReasonerFactory reasonerFactory = new FaCTPlusPlusReasonerFactory();
			//, new SimpleConfiguration()); //BufferingMode.NON_BUFFERING
			
			//return reasonerFactory.createReasoner(logical_onto);
			return null;
		}
		catch(Exception e){
			System.err.println("Error reasoning with FaCT++");
			e.printStackTrace();
			return null;
		}
		
	}


	/*public static OWLReasoner getJFactReasoner(OWLOntology onto){
		System.out.println("\t...using JFact...");
		JFactFactory reasonerFactory = new JFactFactory();	        
		return reasonerFactory.createReasoner(onto, new SimpleConfiguration());
	}*/
	
	public static OWLReasoner getHermiTreasoner(OWLOntology onto){
		System.out.println("\t...using HermiT...");
		OWLReasonerFactory reasonerFactory = new Reasoner.ReasonerFactory();
		Configuration rcnf = new Configuration();
		rcnf.ignoreUnsupportedDatatypes = true;
		rcnf.bufferChanges = false;
		return reasonerFactory.createReasoner(onto, rcnf);
	}
	
	
	public static OWLReasoner getPelletReasoner(OWLOntology onto){
		System.out.println("\t...using Pellet...");
	//	OWLReasonerFactory reasonerFactory = new PelletReasonerFactory();
		//return reasonerFactory.createReasoner(onto);
		return null;
	}
	
	

}
