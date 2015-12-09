C = File.read('data.txt').lines.map{|l| /(\w+) to (\w+) = (\d+)/.match l}.map{|m| {from: m[1], to: m[2], distance: m[3].to_i}}
Cities = C.inject([]){|t,n| t += [n[:from], n[:to]]}.sort.uniq
Distances = C.map{|n| [['%{from}->%{to}' % n, n[:distance]], ['%{to}->%{from}' % n, n[:distance]]] }.flatten(1).to_h
PossibleRoutes = Cities.permutation.map{ |path|
	[path.each_cons(2).to_a.map{|pair|
		Distances.fetch('%s->%s' % pair, Float::INFINITY)
	}.inject(:+), path]
}.reject{|d,p| d == Float::INFINITY}

puts 'Task 1: %s' % PossibleRoutes.map{|d,p| d}.min
puts 'Task 2: %s' / PossibleRoutes.map{|d,p| d}.max
