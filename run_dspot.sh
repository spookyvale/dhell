#!/bin/sh
################################################################################

# get dspot jar
wget -nc https://github.com/STAMP-project/dspot/releases/download/dspot-1.2.1/dspot-1.2.1-jar-with-dependencies.jar
dspotJar=`ls *dependencies.jar`
dspotPropertiesFile="dhell.dspot"

traceFile="dspot.traces"

echo "java -jar $dspotJar --path-to-properties $dspotPropertiesFile -i 1 --test eu.stampproject.examples.dhell.HelloAppTest -a MethodAdd --verbose" 2>&1 | tee $traceFile
echo "--------------------------------------------------------------------------------" >>  $traceFile
java -jar $dspotJar --path-to-properties $dspotPropertiesFile -i 1 --test eu.stampproject.examples.dhell.HelloAppTest -a MethodAdd --verbose 2>&1 | tee -a $traceFile
