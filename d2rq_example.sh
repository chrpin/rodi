

SCENARIOS_ID[0]=cmt_renamed
SCENARIOS_ID[1]=cmt2sigkdd

BOOTSTRAPPER_ID=d2rq

TOOLS_FOLDER=tools




for i in {0..1}
do

SCENARIO_ID=${SCENARIOS_ID[$i]}
echo "TESTING "$SCENARIO_ID" with "$BOOTSTRAPPER_ID

###EVAL PROCESS
#---------------

#Align ontology created by tool with scenario ontology. In this case the tool ontology already includes materialized data
date
echo "Performing alignment between tool ontology and scenario ontology..."
java -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --alignment --scenario=$SCENARIO_ID --bootstrapper=$BOOTSTRAPPER_ID

#Copy ontology from tool folder to correspondent folder
cp ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/aligned_ontology.rdf ./ontology/ontology.rdf

echo "...done"

date
echo "Setting up the RODI benchmark..."
java -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=$SCENARIO_ID --setup-ontology > ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/out_setup_$SCENARIO_ID 2> ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/err_setup_$SCENARIO_ID

#Mappings are already materialized
#cp ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/mappings.ttl ./r2rml

echo "...done"


#We split evaluation into two substeps: reasoning + eval queries, since we do not need to run the mappings again (materialization given by the input ontology)
#Reasoning still required.
date
echo "Trigger reasoning..."
java -Xms2G -Xmx15G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=$SCENARIO_ID --title=$BOOTSTRAPPER_ID --eval-reasoning > ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/out_eval_reasoning$SCENARIO_ID"_"$BOOTSTRAPPER_ID 2> ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/err_eval_reasoning$SCENARIO_ID"_"$BOOTSTRAPPER_ID

echo "...done"


date
echo "Performing the evaluation..."
java -cp $CLASSPATH -Xms2G -Xmx15G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=$SCENARIO_ID --title=$BOOTSTRAPPER_ID --eval-queries > ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/out_eval_queries$SCENARIO_ID"_"$BOOTSTRAPPER_ID 2> ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/err_eval_queries$SCENARIO_ID"_"$BOOTSTRAPPER_ID
date

echo "...done"


#Remove ontology
rm ./ontology/ontology.rdf


echo " "

done




