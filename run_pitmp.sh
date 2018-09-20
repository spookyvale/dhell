#!/bin/sh
################################################################################
if test "X$1" = "X"
then
   outputFormat="HTML"
else
   outputFormat="$1"
fi

pomFile="pom.xml"
sourcePomFile="pom.xml.pitmp"

mvn clean 2>&1 >/dev/null
cp $sourcePomFile $pomFile
mvn install 2>&1 >/dev/null
fileExtension="pitmp"

echo "######## `date +%T`" 2>&1 | tee $fileExtension.traces

echo mvn pitmp:run "-DoutputFormats=$outputFormat" 2>&1 | tee -a $fileExtension.traces
mvn pitmp:run "-DoutputFormats=$outputFormat" 2>&1 | tee -a $fileExtension.traces

echo "######## `date +%T`" 2>&1 | tee -a $fileExtension.traces
