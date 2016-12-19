pos_file_pass = 'pos/'
neg_file_pass = 'neg/'
pos_half_latter = `ls #{pos_file_pass}`.split("\n").to_enum.with_index.select { |_a, b| b >= 500 }.map { |a, _b| a }.map { |name| pos_file_pass + name }.join(' ')
neg_half_latter = `ls #{neg_file_pass}`.split("\n").to_enum.with_index.select { |_a, b| b >= 500 }.map { |a, _b| a }.map { |name| neg_file_pass + name }.join(' ')

system("mv #{pos_half_latter} testPos")
system("mv #{neg_half_latter} testNeg")
