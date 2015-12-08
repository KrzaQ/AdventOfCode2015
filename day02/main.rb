R = File.read('data.txt').lines.map{|l| l.split('x').map{|n| n.to_i}.sort}

puts "Task 1: %d" % R.map{|a,b,c| 3*a*b + 2*a*c + 2*b*c }.inject(:+)
puts "Task 2: %d" % R.map{|a,b,c| 2*a+2*b + a*b*c}.inject(:+)