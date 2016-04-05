@echo off

SET SCENARIO_ID=cmt_renamed
::Requires cmt_mixed scenario database
::SET SCENARIO_ID=cmt2sigkdd

SET BOOTSTRAPPER_ID=d2rq

SET TOOLS_FOLDER=tools

::Path to java
SET java="%JAVA_HOME%bin\java"

echo TESTING %SCENARIO_ID% with %BOOTSTRAPPER_ID%

::EVAL PROCESS
::---------------
::Align ontology created by tool with scenario ontology. In this case the tool ontology already includes materialized data
echo "Performing alignment between bootstrapped ontology and scenario ontology..."
%java% -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --alignment --scenario=%SCENARIO_ID% --bootstrapper=%BOOTSTRAPPER_ID%

::Copy ontology and mappings from tool folder to correspondent folders
copy .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\aligned_ontology.rdf .\ontology\ontology.rdf

echo "...done"

echo "Setting up the RODI benchmark..."
%java% -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=%SCENARIO_ID% --setup-ontology > .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\out_setup_%SCENARIO_ID% 2> .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\err_setup_%SCENARIO_ID%

::#Mappings are already materialized
::copy .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\mappings.ttl .\r2rml

echo "...done"

::We split evaluation into two substeps: reasoning + eval queries, since we do not need to run the mappings again (materialization given by the input ontology)
::Reasoning still required.
echo "Trigger reasoning..."
%java% -Xms2G -Xmx15G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=%SCENARIO_ID% --title=%BOOTSTRAPPER_ID% --eval-reasoning > .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\out_eval_reasoning_%SCENARIO_ID%"_"%BOOTSTRAPPER_ID% 2> .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\err_eval_reasoning_%SCENARIO_ID%"_"%BOOTSTRAPPER_ID%

echo "...done"

echo "Performing the evaluation..."
%java% -Xms2G -Xmx15G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=%SCENARIO_ID% --title=%BOOTSTRAPPER_ID% --eval-queries > .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\out_eval_queries_%SCENARIO_ID%"_"%BOOTSTRAPPER_ID% 2> .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\err_eval_queries_%SCENARIO_ID%"_"%BOOTSTRAPPER_ID%

echo "...done"

echo Results for '%BOOTSTRAPPER_ID%' in scenario '%SCENARIO_ID%' available in reports folder.
echo Log files available in '.\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\' folder.


::Remove ontology
del .\ontology\ontology.rdf




