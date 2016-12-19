# Large_Data_SVM
より大きなデータを扱うSVM(Support Vector Machine)

## 概要
input/以下にあるファイルを、SVMが学習し、それらを分類する。
src/以下には、Haskellのファイルがあるが、それは、TFIDFのアルゴリズムを使ってSVMに適用するファイルを生成する。
SVMは、svm_lightのlinux版を使用している。

## 使い方
```shell
$ ruby convert_vector__and_classify.rb
```
で、実行可能

入力ファイルは、input/以下に置き、そのファイル名を、convert_vector__and_classify.rbに記述する
