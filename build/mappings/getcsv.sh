#!/bin/bash 

#$BASEURI="https://docs.google.com/spreadsheet/pub?key=";
#$KEY="0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE";

#getcsvfile() {
#	foo="--no-check-certificate --output-document="$1
#	echo $foo;
#}
#snd() {	echo $1; }  

#getcsvfile "disco-classes.csv" 0


wget --no-check-certificate --output-document=disco-classes.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=0&output=csv'
wget --no-check-certificate --output-document=external-classes.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=6&output=csv'
wget --no-check-certificate --output-document=disco-object-properties.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=2&output=csv'
wget --no-check-certificate --output-document=external-object-properties.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=5&output=csv'
wget --no-check-certificate --output-document=disco-datatype-properties.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=3&output=csv'
wget --no-check-certificate --output-document=external-datatype-properties.csv 'https://docs.google.com/spreadsheet/pub?key=0AnXXOuMQghwxdG1wU1EzLVJybHp6SDI5ZHJOTUlzOVE&single=true&gid=4&output=csv'

