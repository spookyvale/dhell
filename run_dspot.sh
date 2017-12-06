#!/bin/sh
# running tests
# find all classes in target/test-classes and run each of them with jUnit
################################################################################

# java -jar ../dspot/target/dspot-1.0.0-jar-with-dependencies.jar  -p dspot.properties -i 1 -t fr.inria.stamp.examples.dhell.HelloAppTest -a MethodAdd

java -verbose -jar ../dspot/target/dspot-1.0.0-jar-with-dependencies.jar --path-to-properties dspot.properties --iteration 2 --test fr.inria.stamp.examples.dhell.HelloAppTest --cases test --amplifiers NumberLiteralAmplifier --test-criterion PitMutantScoreSelector

# java -jar /home/cael/stamp/inria_github/dspot/target/dspot-1.0.0-jar-with-dependencies.jar --path-to-properties /home/cael/stamp/inria_github/dhell/dspot.properties --iteration 2 --test fr.inria.stamp.examples.dhell.HelloAppTest --cases test --amplifiers NumberLiteralAmplifier --test-criterion PitMutantScoreSelector
