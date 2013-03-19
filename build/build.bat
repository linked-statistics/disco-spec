@echo off
SET SAXON=C:\Users\olof\Dropbox\utils\saxon-he\saxon9he.jar

echo -----convert turtle to other formats-----
call rdfcopy ../discovery.ttl TURTLE RDF/XML-ABBREV > ../discovery-abbrev.xml
call rdfcopy ../discovery.ttl TURTLE RDF/XML > ../discovery.xml
call rdfcopy ../discovery.ttl TURTLE N3 > ../discovery.n3

echo -----create html documentation from rdf/xml-----
call java -cp %SAXON% net.sf.saxon.Transform -t -s:../discovery-abbrev.xml -xsl:rdf2html.xsl -o:../documentation/classes.html
echo -----done-----