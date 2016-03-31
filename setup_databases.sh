
SCENARIOS_ID[0]=cmt_renamed
SCENARIOS_ID[1]=cmt2sigkdd
SCENARIOS_ID[2]=cmt_mixed



for i in {0..2}
do

SCENARIO_ID=${SCENARIOS_ID[$i]}
echo "SETTING-UP DATABASE FOR "$SCENARIO_ID

date
echo "Setting up database..."
java -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=$SCENARIO_ID --setup
echo "...done"
date

echo " "

done



