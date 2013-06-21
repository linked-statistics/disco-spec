set LANGUAGE=en_EN
wget                                          --output-file=wget_response.txt   --output-document=result_root.html                  --server-response http://rdf-vocabulary.ddialliance.org/
wget                                          --append-output=wget_response.txt --output-document=result_default.html               --server-response http://rdf-vocabulary.ddialliance.org/discovery
wget --header="Accept: text/html"             --append-output=wget_response.txt --output-document=result_text_html.html             --server-response http://rdf-vocabulary.ddialliance.org/discovery
wget --header="Accept: application/xhtml+xml" --append-output=wget_response.txt --output-document=result_application_xhtml_xml.html --server-response http://rdf-vocabulary.ddialliance.org/discovery
wget --header="Accept: text/n3"               --append-output=wget_response.txt --output-document=result_text_n3.n3                 --server-response http://rdf-vocabulary.ddialliance.org/discovery
wget --header="Accept: text/rdf+n3"           --append-output=wget_response.txt --output-document=result_text_rdf_n3.n3             --server-response http://rdf-vocabulary.ddialliance.org/discovery
wget --header="Accept: application/rdf+xml"   --append-output=wget_response.txt --output-document=result_application_rdf_xml.rdf    --server-response http://rdf-vocabulary.ddialliance.org/discovery
wget --header="Accept: text/turtle"           --append-output=wget_response.txt --output-document=result_text_turtle.ttl            --server-response http://rdf-vocabulary.ddialliance.org/discovery
wget --header="Accept: application/x-turtle"  --append-output=wget_response.txt --output-document=result_application_x_turtle.ttl   --server-response http://rdf-vocabulary.ddialliance.org/discovery
