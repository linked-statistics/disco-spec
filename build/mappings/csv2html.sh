#!/bin/bash

# Takes a csv file containing disco mappings
# and transforms them into html table rows

INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

COUNTER=1

echo '<table style="text-align: left; font-size: 70%;">'
echo '  <thead>'
echo '      <tr>'
echo '          <th style="font-weight: bold;">#<br/></td>'
echo '          <th style="vertical-align: top; text-align: center; font-weight: bold;">property</th>'
echo '          <th style="vertical-align: top; text-align: center; font-weight: bold;">domain class</th>'
echo '          <th style="vertical-align: top; text-align: center; font-weight: bold;">range class</th>'
echo '          <th style="vertical-align: top; text-align: center; font-weight: bold;">DDI-L</th>'
echo '          <th style="vertical-align: top; text-align: center; font-weight: bold;">DDI-L Documentation</th>'
echo '      </tr>'
echo '  </thead>'
echo '  <tbody>'

sed 1d $INPUT | while read entity ddi_c ddi_l context sparql ddi_l_documentation
do
	echo "    <tr>"
	echo "      <td>#$COUNTER </td>"
	echo "      <td>$entity</td>"
	echo "      <td></td>"
	echo "      <td></td>"
	echo "      <td>$ddi_l</td>"	
	echo "      <td>$context</td>"
	if [ -n "${ddi_l_documentation-}" ]; then
		echo "  <td><a href='$ddi_l_documentation'>DDI-L Documentation</a>"
	else
		echo "  <td></td>"
	fi		
	echo "    </tr>"
	
	COUNTER=$((COUNTER+1))
done

echo '  </tbody>'
echo '</table>'

IFS=$OLDIFS
