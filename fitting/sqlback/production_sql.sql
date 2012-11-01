#!/bin/bash
src_path=/home/lindp/program/rails/jzns/jzns
des_path=/home/lindp/back

cd des_path

month=`date +%m`
day=`date +%d`
hour=`date +%H`
min=`date +%M`

release_file_name=public$month$day$hour$min.tar
cd ..
tar -zcvf $des_path/$release_file_name -C $src_path/ public