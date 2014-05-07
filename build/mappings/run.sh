#!/bin/bash
sh getcsv.sh

rm -f mapping.ttl
touch mapping.ttl

rm -f mapping.html
touch mapping.html

EXT=csv
for i in $(ls);do
    if [ "${i}" != "${i%.${EXT}}" ];then
        echo "Converting $i to turtle-file"
		sh csv2ttl.sh $i >> mapping.ttl
		echo "Converting $i to html-file"
		sh csv2html.sh $i > "$i.html"
		rm $i
    fi
done