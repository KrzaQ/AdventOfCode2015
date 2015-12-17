D = File.read('data.txt').lines.map(&:to_i)

def combinationsThatSumTo(max, arr)
	arr.select{|n| n <= max}.sort.reverse
	return [] if arr.size == 0
	Enumerator.new do |y|
		arr.each_with_index do |n, i|
			combinationsThatSumTo(max - n, arr[(i+1)..-1]).each do |arr|
				y << [n] + arr
			end
			y << [n] if n == max
		end
	end
end

puts 'Task 1: %s' % combinationsThatSumTo(150, D).count
puts 'Task 2: %s' % combinationsThatSumTo(150, D).group_by{|n| n.size}.to_a.min { |a,b| a.first <=> b.first }[1].size
