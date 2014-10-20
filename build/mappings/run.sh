#! /bin/bash
#get latest csv-files from google drive
KEY="0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE"
wget --no-check-certificate --output-document=disco-classes.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=0&output=csv'
wget --no-check-certificate --output-document=external-classes.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=6&output=csv'
wget --no-check-certificate --output-document=disco-object-properties.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=2&output=csv'
wget --no-check-certificate --output-document=external-object-properties.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=5&output=csv'
wget --no-check-certificate --output-document=disco-datatype-properties.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=3&output=csv'
wget --no-check-certificate --output-document=external-datatype-properties.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=4&output=csv'

#prepare turtle mapping file
rm -f mapping.ttl
touch mapping.ttl
echo "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>." >> mapping.ttl
echo "@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>." >> mapping.ttl
echo "@prefix xsd: <http://www.w3.org/2001/XMLSchema#>." >> mapping.ttl
echo "@prefix dc: <http://purl.org/dc/elements/1.1/>." >> mapping.ttl
echo "@prefix dcterms: <http://purl.org/dc/terms/>." >> mapping.ttl
echo "@prefix dcat: <http://www.w3.org/ns/dcat#>." >> mapping.ttl
echo "@prefix skos: <http://www.w3.org/2004/02/skos/core#>." >> mapping.ttl
echo "@prefix qb: <http://purl.org/linked-data/cube#>." >> mapping.ttl
echo "@prefix owl: <http://www.w3.org/2002/07/owl#>." >> mapping.ttl
echo "@prefix disco: <http://rdf-vocabulary.ddialliance.org/discovery#>." >> mapping.ttl
echo "@prefix foaf: <http://xmlns.com/foaf/0.1/>." >> mapping.ttl
echo "@prefix adms: <http://www.w3.org/ns/adms#>." >> mapping.ttl
echo "@prefix org: <http://www.w3.org/ns/org#>." >> mapping.ttl
echo "@prefix prov: <http://www.w3.org/ns/prov#>." >> mapping.ttl
echo "@prefix schema: <http://schema.org/>." >> mapping.ttl
echo "@prefix swrc: <http://swrc.ontoware.org/ontology#>." >> mapping.ttl
echo "@prefix xkos: <http://purl.org/linked-data/xkos#>." >> mapping.ttl

#Populate documents
rm -f mapping.html
touch mapping.html

HEADING="Classes ( disco )"
PROCESS="disco-classes"
echo "<section>"  >> mapping.html
echo "	<h4>$HEADING</h4>"  >> mapping.html
sh csv2html.sh "${PROCESS}.csv"  >> mapping.html
echo "</section>"  >> mapping.html

echo "" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "# ${HEADING}" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "" >> mapping.ttl
sh csv2ttl.sh "${PROCESS}.csv" >> mapping.ttl
rm "${PROCESS}.csv"

HEADING="Object properties ( disco )"
PROCESS="disco-object-properties"
echo "<section>"  >> mapping.html
echo "	<h4>$HEADING</h4>"  >> mapping.html
sh csv2html.sh "${PROCESS}.csv"  >> mapping.html
echo "</section>"  >> mapping.html

echo "" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "# ${HEADING}" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "" >> mapping.ttl
sh csv2ttl.sh "${PROCESS}.csv" >> mapping.ttl
rm "${PROCESS}.csv"

HEADING="Datatype properties ( disco )"
PROCESS="disco-datatype-properties"
echo "<section>"  >> mapping.html
echo "	<h4>$HEADING</h4>"  >> mapping.html
sh csv2html.sh "${PROCESS}.csv"  >> mapping.html
echo "</section>"  >> mapping.html

echo "" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "# ${HEADING}" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "" >> mapping.ttl
sh csv2ttl.sh "${PROCESS}.csv" >> mapping.ttl
rm "${PROCESS}.csv"

HEADING="Classes ( external vocabularies )"
PROCESS="external-classes"
echo "<section>"  >> mapping.html
echo "	<h4>$HEADING</h4>"  >> mapping.html
sh csv2html.sh "${PROCESS}.csv"  >> mapping.html
echo "</section>"  >> mapping.html

echo "" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "# ${HEADING}" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "" >> mapping.ttl
sh csv2ttl.sh "${PROCESS}.csv" >> mapping.ttl
rm "${PROCESS}.csv"

HEADING="Object properties ( external vocabularies )"
PROCESS="external-object-properties"
echo "<section>"  >> mapping.html
echo "	<h4>$HEADING</h4>"  >> mapping.html
sh csv2html.sh "${PROCESS}.csv"  >> mapping.html
echo "</section>"  >> mapping.html

echo "" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "# ${HEADING}" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "" >> mapping.ttl
sh csv2ttl.sh "${PROCESS}.csv" >> mapping.ttl
rm "${PROCESS}.csv"

HEADING="Datatype properties ( external vocabularies )"
PROCESS="external-datatype-properties"
echo "<section>"  >> mapping.html
echo "	<h4>$HEADING</h4>"  >> mapping.html
sh csv2html.sh "${PROCESS}.csv"  >> mapping.html
echo "</section>"  >> mapping.html

echo "" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "# ${HEADING}" >> mapping.ttl
echo "#################################################################" >> mapping.ttl
echo "" >> mapping.ttl
sh csv2ttl.sh "${PROCESS}.csv" >> mapping.ttl
rm "${PROCESS}.csv"