#!/usr/bin/env bash

###
# mv_file.sh
###

function usage() {
cat <<_EOT_
Usage:
  no parameter: num_pos=50, num_neg=50
   \$1: num_pos=\$1, num_neg=\$1
   \$1, \$2: num_pos=\$1, num_neg=\$2

Description:
  posとnegにあるファイルの一部を、testPosとtestegに分配する
_EOT_
exit 1
}

num_pos_move_files=50
num_neg_move_files=50

if [ $# -eq 1 ]; then
  num_pos_move_files=$1
  num_neg_move_files=$1
fi

if [ $# -eq 2 ]; then
  num_pos_move_files=$1
  num_neg_move_files=$2
fi

for file in `ls -d pos/* | head -n ${num_pos_move_files}`
do
  mv ${file} testPos/
done

for file in `ls -d neg/* | head -n ${num_neg_move_files}`
do
  mv ${file} testNeg/
done