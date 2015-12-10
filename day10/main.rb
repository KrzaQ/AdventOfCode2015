def elvify(n, depth)
	ret = n.to_s.each_char.chunk{|c| c}.map{|q, a| [a.size.to_s, a.first]}.flatten.join
	depth == 1 ? ret : elvify(ret, depth - 1)
end

puts 'Task 1: %s' % elvify('3113322113',40).size
puts 'Task 2: %s' % elvify('3113322113',50).size
