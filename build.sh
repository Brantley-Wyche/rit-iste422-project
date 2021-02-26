#!/bin/sh
echo "Cleaning existing classes..."
rm -f *.class
# This command looks for matching files and runs the rm command for each file
# Note that {} are replaced with each file name
find . -name \*.class -exec rm {} \;

echo "Compiling source code..."
javac src/main/java/*.java -d build
if [ $? -ne 0 ] ; then echo BUILD FAILED!; exit 1; fi

# test compile fails for now
#echo "Compiling unit tests..."
#javac -cp "./src/java/*:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar" test/java/*.java
#if [ $? -ne 0 ] ; then echo BUILD FAILED!; exit 1; fi

#echo "Running unit tests..."
#java -cp ".:src/main/java/*:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar org.junit.runner.JUnitCore" EdgeConnectorTest
#if [ $? -ne 0 ] ; then echo TESTS FAILED!; exit 1; fi

echo "Running application..."
java -cp .:build RunEdgeConvert
