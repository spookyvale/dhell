#!/bin/sh
################################################################################
if test "X$1" = "X"
then
   outputFormat="HTML"
else
   outputFormat="$1"
fi

pomFile="pom.xml"
sourcePomFile="pom.xml.pitest_descartes"

mvn clean 2>&1 >/dev/null
cp $sourcePomFile $pomFile
mvn install 2>&1 >/dev/null

fileExtension="pitest_descartes"

echo "######## `date +%T`" 2>&1 | tee $fileExtension.traces

echo mvn org.pitest:pitest-maven:mutationCoverage "-DoutputFormats=$outputFormat" 2>&1 | tee -a $fileExtension.traces
mvn org.pitest:pitest-maven:mutationCoverage "-DoutputFormats=$outputFormat" 2>&1 | tee -a $fileExtension.traces

echo "######## `date +%T`" 2>&1 | tee -a $fileExtension.traces
