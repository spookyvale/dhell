#!/bin/sh
################################################################################
pomFile="pom.xml"
sourcePomFile="pom.xml.pitmp_descartes"

mvn clean 2>&1 >/dev/null
cp $sourcePomFile $pomFile
mvn install 2>&1 >/dev/null
fileExtension="pitmp_descartes"

echo "######## `date +%T`" 2>&1 | tee $fileExtension.traces

mvn -e pitmp:run 2>&1 | tee -a $fileExtension.traces

echo "######## `date +%T`" 2>&1 | tee -a $fileExtension.traces
