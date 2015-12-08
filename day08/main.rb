D = File.read('data.txt').split("\n")
T = { '"' => '\\"', '\\' => '\\\\'}

puts 'Task 1: %s' % D.map{|l| l.size - eval(l).size}.inject(:+)
puts 'Task 2: %s' % D.map{|l| l.gsub(Regexp.union(T.keys), T).size + 2 - l.size }.inject(:+)
