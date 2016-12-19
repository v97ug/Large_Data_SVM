#!/bin/bash

# ２つファイル(肯定的な文と否定的な文)を、それぞれ半分に分けて、ファイルに出力
pos_all_text="rt-polarity-pos.txt"
neg_all_text="rt-polarity-neg.txt"

# 分ける行数
line_num="2665"
tail_line_num=`expr ${line_num} + 1` # 奇数行のため、+1する

# 半分に分けるコマンド
head -${line_num} ${pos_all_text} > rt-polarity-pos-former.txt
tail -${tail_line_num} ${pos_all_text} > rt-polarity-pos-latter.txt

head -${line_num} ${neg_all_text} > rt-polarity-neg-former.txt
tail -${tail_line_num} ${neg_all_text} > rt-polarity-neg-latter.txt
