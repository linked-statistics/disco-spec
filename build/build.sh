#!/bin/sh
SAXON=path/to/saxon-he/
echo convert turtle to other formats
rdfcopy ../discovery.ttl TURTLE RDF/XML-ABBREV > ../discovery-abbrev.xml
rdfcopy ../discovery.ttl TURTLE RDF/XML > ../discovery.xml
rdfcopy ../discovery.ttl TURTLE N3 > ../discovery.n3

echo create html documentation from rdf/xml
java -cp $SAXON net.sf.saxon.Transform -t -s:../discovery-abbrev.xml -xsl:rdf2html.xsl -o:../documentation/classes.html
echo done