#!/bin/bash

#get latest csv-files from google drive
sh getcsv.sh

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


EXT=csv
for i in $(ls);do
    if [ "${i}" != "${i%.${EXT}}" ];then
        echo "Converting $i to turtle-file"
		sh csv2ttl.sh $i >> mapping.ttl
		echo "Converting $i to html-file"
		html=$(sh csv2html.sh $i)
		l="${i%.*}"
		echo "label: $l"
		#command="/<!--begin-${l}-->/{p=1;print;print \"${html}\"}/<!--end-${l}-->/{p=0}!p"
		#echo $command
		rm "${l}.html"
		sh csv2html.sh $i >> "${l}.html"
		
		rm $i
    fi
done