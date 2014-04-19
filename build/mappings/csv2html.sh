#!/bin/bash

# Takes a csv file containing disco mappings
# and transforms them into html table rows

INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

echo '<table style="text-align: left; font-size: 70%;">'
echo '	<thead>'
echo '	  <tr>'
echo '	    <th style="vertical-align: top; text-align: center;">Entity</th>'
echo '		<th style="vertical-align: top; text-align: center;">DDI-C</td>'
echo '		<th style="vertical-align: top; text-align: center;">DDI-L</th>'
echo '		<th style="vertical-align: top; text-align: center;">Context</th>'
echo '		<th style="vertical-align: top; text-align: center;">SPARQL</th>'
echo '	    </tr>'
echo '  </thead>'
echo '  <tbody>'

sed 1d $INPUT | while read entity ddi_c ddi_l context sparql
do
	echo "    <tr>"
	echo "      <td>$entity</td>"
	echo "      <td>$ddi_c</td>"
	echo "      <td>$ddi_l</td>"
	echo "      <td>$context</td>"
	echo "      <td>$sparql</td>"
	echo "    </tr>"
done

echo '  </tbody>'
echo '</table>'
IFS=$OLDIFS
