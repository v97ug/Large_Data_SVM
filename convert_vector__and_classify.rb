pos_file_pass = 'input/pos/'
neg_file_pass = 'input/neg/'
pos_file_names = `ls #{pos_file_pass}`.split("\n").map{|name| pos_file_pass + name}.join(' ')
neg_file_names = `ls #{neg_file_pass}`.split("\n").map{|name| neg_file_pass + name}.join(' ')

system("runhaskell MainPos.hs #{pos_file_names}")
system("runhaskell MainNeg.hs #{neg_file_names}")

svm_light_pass = 'svm_light/'
Dir.chdir(svm_light_pass){
  learn_file = 'allLearn.txt'
  system("cat posLearn.txt negLearn.txt > #{learn_file}")

  system("./svm_learn #{learn_file}")
  test_file = 'allLearnTest.txt'
  system("./svm_classify #{test_file} svm_model")
}