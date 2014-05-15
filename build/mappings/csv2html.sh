#!/bin/bash

# Takes a csv file containing disco mappings
# and transforms them into html table rows

INPUT=$1
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

echo '<table style="text-align: left; font-size: 70%;">'
echo '<thead>'
echo '      <tr>'
echo '          <td style="font-weight: bold;">#<br/></td>'
echo '          <td style="vertical-align: top; text-align: center; font-weight: bold;">property<br/></td>'
echo '          <td style="vertical-align: top; text-align: center; font-weight: bold;">domain class<br/></td>'
echo '          <td style="vertical-align: top; text-align: center; font-weight: bold;">range class<br/></td>'
#echo '          <td style="vertical-align: top; text-align: center; font-weight: bold;">DDI-C<br/></td>'
echo '          <td style="vertical-align: top; text-align: center; font-weight: bold;">DDI-L<br/></td>'
echo '      </tr>'
echo '  </thead>'
echo '  <tbody>'

COUNTER=1
sed 1d $INPUT | while read entity ddi_c ddi_l context sparql
do
	echo "    <tr>"
	echo "      <td>#$COUNTER</td>"
	echo "      <td>$entity</td>"
#	echo "      <td>$ddi_c</td>"
	echo "      <td>$ddi_l</td>"
	echo "      <td>$context</td>"
	echo "      <td>$sparql</td>"
	echo "    </tr>"
	let COUNTER=COUNTER+1
done

echo '  </tbody>'
echo '</table>'
IFS=$OLDIFS
