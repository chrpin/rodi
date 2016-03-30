

SCENARIOS_ID[0]=cmt_renamed

#Requires cmt_mixed scenario database
#java -jar RODI_benchmark.jar --scenario=cmt_mixed --setup
SCENARIOS_ID[1]=cmt2sigkdd

BOOTSTRAPPER_ID=incmap

TOOLS_FOLDER=tools




for i in {0..1}
do

SCENARIO_ID=${SCENARIOS_ID[$i]}
echo "TESTING "$SCENARIO_ID" with "$BOOTSTRAPPER_ID

###EVAL PROCESS
#---------------

date
echo "Setting up the RODI benchmark..."
java -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=$SCENARIO_ID --setup > ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/out_setup_$SCENARIO_ID 2> ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/err_setup_$SCENARIO_ID

#Copy mappings to folder
#Must be here! Mappings are removed from r2rml folder in previous step
cp ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/mappings.ttl ./r2rml

echo "...done"


date
echo "Performing the evaluation..."
java -Xms2G -Xmx15G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=$SCENARIO_ID --title=$BOOTSTRAPPER_ID --eval > ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/out_eval_$SCENARIO_ID"_"$BOOTSTRAPPER_ID 2> ./$TOOLS_FOLDER/$BOOTSTRAPPER_ID/$SCENARIO_ID/err_eval_$SCENARIO_ID"_"$BOOTSTRAPPER_ID

echo "...done"
date

#Remove mappings
rm ./r2rml/mappings.ttl

echo " "

done





