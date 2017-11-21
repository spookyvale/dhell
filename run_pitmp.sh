#!/bin/sh
################################################################################
pomFile="pom.xml"
sourcePomFile="pom.xml.pitmp"

mvn clean 2>&1 >/dev/null
cp $sourcePomFile $pomFile
mvn install

mvn pitmp:run 2>&1 | tee pitmp.traces
