#!/bin/sh
################################################################################
pomFile="pom.xml"
sourcePomFile="pom.xml.pitest_descartes"

mvn clean 2>&1 >/dev/null
cp $sourcePomFile $pomFile
mvn install

mvn org.pitest:pitest-maven:mutationCoverage -DmutationEngine=descartes 2>&1 | tee pitest_descartes.traces
