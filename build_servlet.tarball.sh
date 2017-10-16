#!/bin/bash

TMP_DIR=$(eval mktemp -d)


cd ../../FT/eidos_swing/
git pull origin master
cp -R files/$2 $TMP_DIR 

cd ../methode-swing
git pull origin master
cp -R files/$2 $TMP_DIR

cd $TMP_DIR

tar -C ${TMP_DIR}/$2 -czf servlet.tgz ./
aws --profile $1 s3 cp servlet.tgz s3://cms-tech-s3/ft-${2}/servlet.tgz

rm -rf $TMP_DIR