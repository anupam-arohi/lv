#!/bin/bash

cp ../lv .
position=`grep -n Setup lv | head -1 | cut -f1 -d:`

head -$position ./lv >  ./lv.temp
cat ./lv.test        >> ./lv.temp
tail +$position ./lv >> ./lv.temp

mv ./lv.temp ./lv
chmod +x ./lv


TMP=`mktemp -d /tmp/LV-XXXX`

mkdir -p $TMP/Source
date > $TMP/Source/date_file

echo "1" >count_test.txt

for i in {1..21}; do 
	./lv $TMP/Source $TMP/Destination $TMP/log.txt
done

