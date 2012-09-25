#!/bin/bash
cp -r /home/lindp/Programmer/GitHub/jzns/jzns /home/lindp/Programmer/Release/
cd /home/lindp/Programmer/Release/jzns/

rm tmp/* -rf
rm log/* -rf
rm public/system -rf

month=`date +%m`
day=`date +%d`
hour=`date +%H`
min=`date +%M`

release_file_name=jzns-$month-$day-$hour-$min.tar
tar -cvf /home/lindp/Programmer/Release/$release_file_name /home/lindp/Programmer/Release/jzns/