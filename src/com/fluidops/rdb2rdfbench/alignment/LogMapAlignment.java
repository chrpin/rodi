package com.fluidops.rdb2rdfbench.alignment;

import java.io.File;
import java.util.Set;

import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.io.RDFXMLOntologyFormat;
import org.semanticweb.owlapi.model.IRI;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyManager;

import uk.ac.ox.krr.logmap2.LogMap2_Matcher;
import uk.ac.ox.krr.logmap2.Parameters;
import uk.ac.ox.krr.logmap2.io.OWLAlignmentFormat;
import uk.ac.ox.krr.logmap2.mappings.objects.MappingObjectStr;

public class LogMapAlignment {

	
	LogMap2_Matcher logmap;
	OWLOntology aligned_ontology;
	OWLOntology mappings_ont;
	
	OWLAlignmentFormat owlformat;
	
	
	
	
	
	
	
	
	protected void performAlignment(OWLOntology source, OWLOntology target, String logical_uri) throws Exception{
		
		
		//Call logmap
		Parameters.print_output = false;
		Parameters.output_class_mappings=true;
		Parameters.output_prop_mappings=true;
		Parameters.allow_multilingual=false;
		Parameters.reasoner = Parameters.hermit;
		//Parameters.allow_google_call=false;
		
		logmap = new LogMap2_Matcher(source, target);
		
		
		//integrated_ontology
		createIntegratedOntologyFromMappings(source, target, getMappingsAsSet(), logical_uri);
	
	}
	
	
	
	public OWLOntology getAlignedOWLOntology(){
		return aligned_ontology;
	}
	
	public OWLOntology getMappingsAsOWLOntology(){
		return mappings_ont;
	}
	
	
	public Set<MappingObjectStr> getMappingsAsSet(){
		return logmap.getLogmap2_Mappings();
	}
	
	


	
	
	/**
	 * Creates integrated ontology
	 * @param mappings
	 * @throws Exception
	 */
	private void createIntegratedOntologyFromMappings(
			OWLOntology source,
			OWLOntology target,
			Set<MappingObjectStr> mappings,
			String integrated_onto_uri) throws Exception{
		
		owlformat = new OWLAlignmentFormat("");
				
		for (MappingObjectStr mapping : mappings){
			if (mapping.getTypeOfMapping()==MappingObjectStr.CLASSES){
				owlformat.addClassMapping2Output(
						mapping.getIRIStrEnt1(), 
						mapping.getIRIStrEnt2(),
						mapping.getMappingDirection(),
						mapping.getConfidence());
				
		
			}
			
			else if (mapping.getTypeOfMapping()==MappingObjectStr.OBJECTPROPERTIES){
				owlformat.addObjPropMapping2Output(
						mapping.getIRIStrEnt1(),
						mapping.getIRIStrEnt2(),
						mapping.getMappingDirection(),
						mapping.getConfidence());
				
		
			}
			
			else if (mapping.getTypeOfMapping()==MappingObjectStr.DATAPROPERTIES){
				owlformat.addDataPropMapping2Output(
						mapping.getIRIStrEnt1(), 
						mapping.getIRIStrEnt2(),
						mapping.getMappingDirection(),
						mapping.getConfidence());
				
		
			}
			
			else if (mapping.getTypeOfMapping()==MappingObjectStr.INSTANCES){
				owlformat.addInstanceMapping2Output(
						mapping.getIRIStrEnt1(), 
						mapping.getIRIStrEnt2(),
						mapping.getConfidence());			
		
			}
		}
		
		
		mappings_ont = owlformat.getOWLOntology();
		
				
		OWLOntologyManager manager = OWLManager.createOWLOntologyManager();

		
		aligned_ontology = manager.createOntology(
				//IRI.create("http://eu.optique.bootstrapping.ontology/statoil_integrated" + System.currentTimeMillis()));
				IRI.create(integrated_onto_uri));
		
		
		//Format as required the platform
		manager.setOntologyFormat(aligned_ontology, new RDFXMLOntologyFormat() );

		manager.addAxioms(aligned_ontology, source.getAxioms());
		
		//manager.addAxioms(aligned_ontology, target.getAxioms());		
		manager.addAxioms(aligned_ontology, target.getTBoxAxioms(true));
		manager.addAxioms(aligned_ontology, target.getRBoxAxioms(true)); 
		//TODO Add Abox in case it is given the materialised ontology
		manager.addAxioms(aligned_ontology, target.getABoxAxioms(true));
		
		manager.addAxioms(aligned_ontology, mappings_ont.getAxioms());		
		
	}
	
	
	
	
	
	
	
	



	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String scenario="";
		String bootstrapper="";
		
		for (int i = 0; i < args.length; i++) {
			if (args[i].startsWith("--scenario")) {
				scenario = args[i].substring(11);
			}
			else if (args[i].startsWith("--bootstrapper")) {
				bootstrapper = args[i].substring(15);
			}
			else if (args[i].equals("--help")) {
				System.out.println("Two additional parameters required: --alignment --scenario=SCENARIO_ID --bootstrapper=BOOTSTRAPPER_NAME");
				return;
			}
		}
		
		if (scenario.equals("") || bootstrapper.equals("")){
			System.out.println("Two additional parameters required: --alignment --scenario=SCENARIO_ID --bootstrapper=BOOTSTRAPPER_NAME");
			return;
		}
		
		//System.out.println(scenario + " " + bootstrapper);
		
		
		
		try{
			LogMapAlignment aligner = new LogMapAlignment();
			
			OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
			
			String[] sourceOntologyPaths = new String[4];
			sourceOntologyPaths[0]="./data/"+ scenario + "/ontology.ttl";
			sourceOntologyPaths[1]="./data/"+ scenario + "/ontology.n3";
			sourceOntologyPaths[1]="./data/"+ scenario + "/ontology.nt";
			sourceOntologyPaths[2]="./data/"+ scenario + "/ontology.rdf";
			sourceOntologyPaths[3]="./data/"+ scenario + "/ontology.owl";
			
			
			String[] targetOntologyPaths = new String[4];
			targetOntologyPaths[0]="./tools/"+ bootstrapper + "/" + scenario + "/ontology.ttl";
			targetOntologyPaths[1]="./tools/"+ bootstrapper + "/" + scenario + "/ontology.n3";
			targetOntologyPaths[1]="./tools/"+ bootstrapper + "/" + scenario + "/ontology.nt";
			targetOntologyPaths[2]="./tools/"+ bootstrapper + "/" + scenario + "/ontology.rdf";
			targetOntologyPaths[3]="./tools/"+ bootstrapper + "/" + scenario + "/ontology.owl";
			
			
			OWLOntology source = null;
			OWLOntology target = null;
			
			// load source ontology file
			for (int i=0; i<sourceOntologyPaths.length; i++) {
				File file = new File(sourceOntologyPaths[i]);
				if (file.exists()){
					source = manager.loadOntologyFromOntologyDocument(file);
					break;
				}
			}				
			
			// load target ontology file
			for (int i=0; i<targetOntologyPaths.length; i++) {
				File file = new File(targetOntologyPaths[i]);
				if (file.exists()){
					target = manager.loadOntologyFromOntologyDocument(file);
					break;
				}
			}				
			
			if (source==null || target==null){
				System.out.println("The ontologies to be aligned are missing!!");
				return;
			}
			
			
			aligner.performAlignment(
					source, 
					target,
					"http://rodi.fluidops.com/aligned_ontology_"+ scenario+"_"+bootstrapper);
			
			System.out.println("\tAlignments extracted with LogMap: " + aligner.getMappingsAsSet().size());
			
			int class_alignments = 0;
			int prop_alignments = 0;
			for (MappingObjectStr mapping : aligner.getMappingsAsSet()){
				//System.out.println(mapping.toString());
				if (mapping.isDataPropertyMapping() || mapping.isObjectPropertyMapping())
					prop_alignments++;
				else if (mapping.isClassMapping()){
					class_alignments++;
				}
				
			}
			System.out.println("\t\tClass alignments: " + class_alignments);
			System.out.println("\t\tProperty alignments: " + prop_alignments);
			
			
			
			String phy_iri_onto = "./tools/"+bootstrapper + "/" + scenario + "/aligned_ontology.rdf";
			
			File file = new File(phy_iri_onto);
			
			manager.saveOntology(aligner.getAlignedOWLOntology(), new RDFXMLOntologyFormat(), IRI.create(file.toURI()));
			
			//System.out.println("Aligned/Merged ontology stored in: " +  "./tools/"+bootstrapper + "/" + scenario + "/aligned_ontology.rdf");
			
		} 
		catch (Exception e){
			e.printStackTrace();
		}
		
	}


}
