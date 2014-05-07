#!/bin/bash

# Takes a csv file containing disco mappings
# and transforms them into turtle

INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
sed 1d $INPUT | while read entity ddi_c ddi_l context sparql
do
	if [ -n "${ddi_l-}" ]; then
		echo "$entity a rdfs:Class, owl:Class;"
		echo "disco:mapping ["
		echo "  disco:DDI3.1XPath '$ddi_l';"
		if [ -n "${ddi_c-}" ]; then
			echo "  disco:DDI2.1XPath '$ddi_c';"
		fi
		if [ -n "${context-}" ]; then
			echo "  disco:context '$context';"
		fi
		if [ -n "${sparql-}" ]; then
			echo "  disco:sparql '$sparql';"
		fi
		echo "]"
	fi
done
IFS=$OLDIFS
