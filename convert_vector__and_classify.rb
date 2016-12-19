pos_file_pass = 'input/pos/'
neg_file_pass = 'input/neg/'
pos_test_pass = 'input/testPos/'
neg_test_pass = 'input/testNeg/'
pos_file_names = `ls #{pos_file_pass}`.split("\n").map { |name| pos_file_pass + name }.join(' ')
neg_file_names = `ls #{neg_file_pass}`.split("\n").map { |name| neg_file_pass + name }.join(' ')
pos_test_names = `ls #{pos_test_pass}`.split("\n").map { |name| pos_test_pass + name }.join(' ')
neg_test_names = `ls #{neg_test_pass}`.split("\n").map { |name| neg_test_pass + name }.join(' ')

svm_light_pass = 'svm_light/'
pos_learn_file = 'posLearn.txt'
neg_learn_file = 'negLearn.txt'
pos_test_file = 'posTest.txt'
neg_test_file = 'negTest.txt'
system("./MainPos #{pos_file_names} > #{svm_light_pass}#{pos_learn_file}")
system("./MainNeg #{neg_file_names} > #{svm_light_pass}#{neg_learn_file}")
system("./MainPos #{pos_test_names} > #{svm_light_pass}#{pos_test_file}")
system("./MainNeg #{neg_test_names} > #{svm_light_pass}#{neg_test_file}")

Dir.chdir(svm_light_pass) do
    learn_file = 'allLearn.txt'
    system("cat #{pos_learn_file} #{neg_learn_file} > #{learn_file}")
    system("./svm_learn #{learn_file}")

    test_file = 'allLearnTest.txt'
    system("cat #{pos_test_file} #{neg_test_file} > #{test_file}")
    system("./svm_classify #{test_file} svm_model")
end
