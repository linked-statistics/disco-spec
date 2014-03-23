#!/bin/bash

# Takes a csv file containing disco mappings
# and transforms them into turtle

INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
sed 1d $INPUT | while read entity ddi_c ddi_l context sparql
do
	echo "$entity a rdfs:Class, owl:Class;"
	echo "disco:mapping ["
	echo "  disco:DDI3.1XPath '$ddi_l';"
	echo "]"
done
IFS=$OLDIFS
