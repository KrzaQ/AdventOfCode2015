D = File.read('data.txt').scan(/(\w+): capacity (-?\d), durability (-?\d), flavor (-?\d), texture (-?\d), calories (-?\d)/)
.map{ |m| [m[0]] + m[1..-1].map(&:to_i)}

def permutations(max, size)
	Enumerator.new do |ret|
		if(size > 1)
			(0..max).each do |n|
				enum = permutations(max - n, size - 1)
				enum.each do |arr|
					ret << [n] + arr
				end
			end
		else
			ret << [max]
		end
	end 
end

R = permutations(100, D.size).map{|arr|
	s = arr.zip(D).map{|n, arr|
		arr[1...5].map{|v| v * n}
	}.inject([0]*4){|t, c|
		t.zip(c).map{|l,r| l+r}
	}.map{|n|
		n < 0 ? 0 : n
	}.inject(:*)
	{score: s, calories: arr.zip(D).map{|n, arr| n * arr.last}.inject(:+)}
}

puts 'Task 1: %s' % R.map{|h| h[:score]}.max
puts 'Task 2: %s' % R.select{|h| h[:calories] == 500}.map{|h| h[:score]}.max
