#!/bin/bash

# Takes a csv file containing disco mappings
# and transforms them into turtle

INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
echo ""
echo "#################"
echo "# mappings from ${INPUT%.*}"
echo ""

sed 1d $INPUT | while read entity ddi_c ddi_l context sparql ddi_l_documentation
do
	if [ -n "${ddi_l-}" ]; then
		if [[ $INPUT == *properties* ]]
		then
			echo "$entity a rdf:Property, owl:DatatypeProperty;"
		else
			echo "$entity a rdfs:Class, owl:Class;"
		fi
		
		echo "  disco:mapping ["
		echo "    a disco:Mapping;"
		echo "    disco:ddi-L-XPath '$ddi_l';"
		if [ -n "${ddi_l_documentation-}" ]; then
			echo "    disco:ddi-L-Documentation  '$ddi_l_documentation';"
		fi		
		#if [ -n "${ddi_c-}" ]; then
			#echo "  disco:DDI2.1XPath '$ddi_c';"
		#fi
		if [ -n "${context-}" ]; then
			echo "    disco:context '$context';"
		fi
		if [ -n "${sparql-}" ]; then
			echo "    disco:context '$sparql';"
		fi
		echo "  ]"
		echo ""
	fi
done
IFS=$OLDIFS
