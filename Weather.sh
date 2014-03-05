#!/bin/sh
. $PWD/Weather.conf

while (true)
do
	#if [ -f $PAGEFILE ]; then rm $PAGEFILE; fi
	wget -t 1 -O $PAGEFILE -o wget.log http://meteo.by/
	grep -m 1 '<span class="max">' $PAGEFILE > temp
	echo "temperature: " $(sed 's/[^\-\+0-9]//g' temp)
	rm temp
	sleep $DELAY
done

