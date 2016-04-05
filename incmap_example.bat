@echo off

SET SCENARIO_ID=cmt_renamed
::Requires cmt_mixed scenario database
::SET SCENARIO_ID=cmt2sigkdd

SET BOOTSTRAPPER_ID=incmap

SET TOOLS_FOLDER=tools

::Path to java
SET java="%JAVA_HOME%bin\java"

echo TESTING %SCENARIO_ID% with %BOOTSTRAPPER_ID%

::EVAL PROCESS
::---------------
echo "Setting up the RODI benchmark..."
%java% -Xms500M -Xmx8G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=%SCENARIO_ID% --setup-ontology > .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\out_setup_%SCENARIO_ID% 2> .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\err_setup_%SCENARIO_ID%

::Copy mappings from tool folder to r2rml folder
::Must be here! Mappings are removed from r2rml folder in previous step
copy .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\mappings.ttl .\r2rml

echo "...done"

echo "Performing the evaluation..."
%java% -Xms2G -Xmx15G -DentityExpansionLimit=100000000 -jar RODI_benchmark.jar --scenario=%SCENARIO_ID% --title=%BOOTSTRAPPER_ID% --eval > .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\out_eval_%SCENARIO_ID%"_"%BOOTSTRAPPER_ID% 2> .\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\err_eval_%SCENARIO_ID%"_"%BOOTSTRAPPER_ID%

echo "...done"

echo Results for '%BOOTSTRAPPER_ID%' in scenario '%SCENARIO_ID%' available in reports folder.
echo Log files available in '.\%TOOLS_FOLDER%\%BOOTSTRAPPER_ID%\%SCENARIO_ID%\' folder.

::Remove mappings
del .\r2rml\mappings.ttl


