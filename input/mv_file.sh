#!/usr/bin/env bash

###
# mv_file.sh
# posとnegにあるファイルの一部を、testPosとtestegに分配する
###

readonly NUM_MOVE_FILES=50

for file in `ls -d pos/* | head -n ${NUM_MOVE_FILES}`
do
  mv ${file} testPos/
done

for file in `ls -d neg/* | head -n ${NUM_MOVE_FILES}`
do
  mv ${file} testNeg/
done