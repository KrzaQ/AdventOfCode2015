D = File.read('data.txt').lines.map(&:to_i).sort.reverse

def combinationsThatSumTo(max, arr)
	arr.select{|n| n <= max}
	Enumerator.new do |y|
		arr.each_with_index do |n, i|
			combinationsThatSumTo(max - n, arr[(i+1)..-1]).each do |arr|
				y << [n] + arr
			end
			y << [n] if n == max
		end
	end
end

Results = combinationsThatSumTo(150, D).to_a

puts 'Task 1: %s' % Results.size
puts 'Task 2: %s' % Results.group_by{|n| n.size}.min{|a,b| a.first <=> b.first }[1].size
