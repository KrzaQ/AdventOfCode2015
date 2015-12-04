require 'digest'
Solve = lambda{|l| (0..1000000000).find_index{|k| Digest::MD5.hexdigest("yzbqklnj#{k}")[0...l] == '0'*l} }
puts 'Task 1: %d' % Solve.call(5)
puts 'Task 2: %d' % Solve.call(6)
