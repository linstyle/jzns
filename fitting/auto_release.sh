#!/bin/bash
src_path=/home/lindp/Programmer/GitHub/jzns/jzns
des_path=/home/lindp/Programmer/Release/

cp -r $src_path $des_path
cd $des_path/jzns/

rm tmp/* -rf
rm log/* -rf
rm public/system -rf

month=`date +%m`
day=`date +%d`
hour=`date +%H`
min=`date +%M`

release_file_name=jzns$month$day$hour$min.tar
cd ..
tar -cvf $des_path/$release_file_name jzns
