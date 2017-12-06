#!/bin/sh
################################################################################
pomFile="pom.xml"
sourcePomFile="pom.xml.pitest"

mvn clean 2>&1 >/dev/null
cp $sourcePomFile $pomFile
mvn install 2>&1 >/dev/null

mvn org.pitest:pitest-maven:mutationCoverage 2>&1 | tee pitest.traces
