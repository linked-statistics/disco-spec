#!/bin/bash

# Takes a csv file containing disco mappings
# and transforms them into html table rows

INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
sed 1d $INPUT | while read entity ddi_c ddi_l context sparql
do
	echo "<tr>"
	echo "  <td>$entity</td>"
	echo "  <td>$ddi_c</td>"
	echo "  <td>$ddi_l</td>"
	echo "  <td>$context</td>"
	echo "  <td>$sparql</td>"
	echo "</tr>"
done
IFS=$OLDIFS
