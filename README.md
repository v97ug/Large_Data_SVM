# Large_Data_SVM
より大きなデータを扱うSVM(Support Vector Machine)

## 概要
input/以下にあるファイルを、SVMが学習し、それらを分類する。
src/以下には、Haskellのファイルがあるが、それは、TFIDFのアルゴリズムを使ってSVMに適用するファイルを生成する。なお、入力のファイルは、複数のファイル。
src_one/以下には、同じくHaskellのファイルがあり、こちらは、入力ファイルが１つだけ。（１行で１ドキュメント）。
これらの処理を、rubyのスクリプトが全てを行ってくれる。
なお、SVMは、svm_lightのlinux６４ビット版を使用している。

## 使い方
1. ファイルが複数ある場合
入力ファイルを、input/pos以下とinput/neg以下に置き、
```shell
$ ruby convert_vector__and_classify.rb
```
を実行する

2. ファイルが１つの場合
入力ファイルを、input/以下に置き、oneFile_convert_vector__and_classify.rbに、ファイル名を記述する。
```shell
$ ruby oneFile_convert_vector__and_classify.rb
```
を実行する。
