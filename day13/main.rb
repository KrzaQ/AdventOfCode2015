D = File.read('data.txt').scan(/(\w+).*(lose|gain) (\d+).*to (\w+)/)
.map{ |left, sign, n, right|
	n = n.to_i
	n = n * -1 if sign == 'lose'
	[left, right, n]
}.inject({}){ |total, arr|
	l, r, n = arr
	h = total.fetch(l, {})
	h[r] = n
	total[l] = h
	total
}

def getBestHappiness(guests)
	guests.permutation.map{ |arr|
		arr.push arr.first
		arr.each_cons(2).map{ |l, r| D.fetch(l,{}).fetch(r, 0) + D.fetch(r,{}).fetch(l, 0) }.inject(:+)
	}.max
end

puts 'Task 1: %s' % getBestHappiness(D.keys)
puts 'Task 2: %s' % getBestHappiness(D.keys + ['self'])
