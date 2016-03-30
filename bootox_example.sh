
SCENARIOS_ID[0]=cmt_renamed
SCENARIOS_ID[1]=cmt2sigkdd

BOOTSTRAPPER_ID=bootox

TOOLS_FOLDER=tools




for i in {0..1}
do

SCENARIO_ID=${SCENARIOS_ID[$i]}
echo "TESTING "$SCENARIO_ID" with "$BOOTSTRAPPER_ID

###EVAL PROCESS
#---------------

#Align ontology created by toold with scenario ontology
date
echo "Performing alignment between bootstrapped ontology and scenario ontology..."
java -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --alignment --scenario=$SCENARIO_ID --bootstrapper=$BOOTSTRAPPER_ID

#Copy ontology and mappings from tool folder to correspondent folders
cp ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/aligned_ontology.rdf ./ontology/ontology.rdf

echo "...done"

date
echo "Setting up the RODI benchmark..."
java -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=$SCENARIO_ID --setup-ontology > ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/out_setup_$SCENARIO_ID 2> ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/err_setup_$SCENARIO_ID

#Copy mappings from tool folder to r2rml folder
#Must be here! Mappings are removed from r2rml folder in previous step
cp ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/mappings.ttl ./r2rml

echo "...done"

date
echo "Performing the evaluation..."
java -Xms2G -Xmx15G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=$SCENARIO_ID --title=$BOOTSTRAPPER_ID --eval > ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/out_eval_$SCENARIO_ID"_"$BOOTSTRAPPER_ID 2> ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/err_eval_$SCENARIO_ID"_"$BOOTSTRAPPER_ID

echo "...done"

date


#Remove ontology
rm ./ontology/ontology.rdf

#Remove mappings
rm ./r2rml/mappings.ttl

echo " "

done



