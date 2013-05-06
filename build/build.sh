#!/bin/sh
SAXON=path/to/saxon-he/
echo convert turtle to other formats
echo RDF/XML-ABBREV
rdfcopy ../discovery.ttl TURTLE RDF/XML-ABBREV > ../discovery-abbrev.xml
echo RDF/XML
rdfcopy ../discovery.ttl TURTLE RDF/XML > ../discovery.xml
echo N3
rdfcopy ../discovery.ttl TURTLE N3 > ../discovery.n3

echo create html documentation from rdf/xml
java -cp $SAXON net.sf.saxon.Transform -t -s:../discovery-abbrev.xml -xsl:rdf2html.xsl -o:../documentation/classes.html
echo removing rdf/xml abbrev (used for generation the documentation)
rm ../discovery-abbrev.xml
echo done