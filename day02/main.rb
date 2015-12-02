T = File.read('data.txt')

R = T.lines.map{|l| /(\d+)x(\d+)x(\d+)/.match l}.map{|m| [m[1].to_i, m[2].to_i, m[3].to_i]}

puts "Task 1: %d" % R.map{|a| a.sort }.map{|a,b,c| 3*a*b + 2*a*c + 2*b*c }.inject(:+)
puts "Task 1: %d" % R.map{|a| a.sort }.map{|a,b,c| 2*a+2*b + a*b*c}.inject(:+)