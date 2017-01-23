#!/usr/bin/env bash

####
# redo_mv_file.sh
# testPos,tesNegにある全てのファイルを、pos,negに戻す
####

for file in `ls -d testPos/*`
do
  mv ${file} pos/
done

for file in `ls -d testNeg/*`
do
  mv ${file} neg/
done