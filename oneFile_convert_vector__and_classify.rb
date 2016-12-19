input_dir = 'input/'
pos_learn_pass = "#{input_dir}rt-polarity-pos-former.txt"
neg_learn_pass = "#{input_dir}rt-polarity-neg-former.txt"
pos_test_pass = "#{input_dir}rt-polarity-pos-latter.txt"
neg_test_pass = "#{input_dir}rt-polarity-neg-latter.txt"

svm_light_pass = 'svm_light/'
pos_learn_file = 'posLearn.txt'
neg_learn_file = 'negLearn.txt'
pos_test_file = 'posTest.txt'
neg_test_file = 'negTest.txt'
pos_exe = 'MainPos_oneFile'
neg_exe = 'MainNeg_oneFile'
system("./#{pos_exe} #{pos_learn_pass} > #{svm_light_pass}#{pos_learn_file}")
system("./#{neg_exe} #{neg_learn_pass} > #{svm_light_pass}#{neg_learn_file}")
system("./#{pos_exe} #{pos_test_pass} > #{svm_light_pass}#{pos_test_file}")
system("./#{neg_exe} #{neg_test_pass} > #{svm_light_pass}#{neg_test_file}")

svm_light_pass = 'svm_light/'
Dir.chdir(svm_light_pass) do
    learn_file = 'allLearn.txt'
    system("cat #{pos_learn_file} #{neg_learn_file} > #{learn_file}")
    system("./svm_learn #{learn_file}")

    test_file = 'allLearnTest.txt'
    system("cat #{pos_test_file} #{neg_test_file} > #{test_file}")
    system("./svm_classify #{test_file} svm_model")
end
