#!/bin/sh
################################################################################

dspotJar=`ls ../dspot/dspot/target/*dependencies.jar`
dspotPropertiesFile="dhell.dspot"

traceFile="dspot.traces"

echo "java -jar $dspotJar --path-to-properties $dspotPropertiesFile -i 1 --test fr.inria.stamp.examples.dhell.HelloAppTest -a MethodAdd --verbose" 2>&1 | tee $traceFile
echo "--------------------------------------------------------------------------------" >>  $traceFile
java -jar $dspotJar --path-to-properties $dspotPropertiesFile -i 1 --test fr.inria.stamp.examples.dhell.HelloAppTest -a MethodAdd --verbose 2>&1 | tee -a $traceFile
