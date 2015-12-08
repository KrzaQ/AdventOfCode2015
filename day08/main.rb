D = File.read('data.txt').split("\n")
puts 'Task 1: %s' % D.map{|l| l.size - eval(l).size}.inject(:+)
puts 'Task 2: %s' % D.map{|l| l.inspect.size - l.size }.inject(:+)
