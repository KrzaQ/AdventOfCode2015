Elvify = lambda{|d| (1..d).inject('3113322113'){ |t| t.each_char.chunk{|c| c}.map{|q, a| [a.size.to_s, a.first]}.flatten.join } }
puts 'Task 1: %s' % Elvify.call(40).size
puts 'Task 2: %s' % Elvify.call(50).size
