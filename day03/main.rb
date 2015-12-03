T = File.read("data.txt")

def simPath(path)
	path.each_char.inject({current: [0,0], total: { [0,0] => 1 }}){ |memo,c|
		point = [{
			'^' => [ 0,  1],
			'>' => [ 1,  0],
			'v' => [ 0, -1],
			'<' => [-1,  0]
		}[c], memo[:current]].transpose.map{ |n| n.inject(:+) }

		memo[:total][point] = memo[:total].fetch(point, 0)+1
		{
			current: point,
			total: memo[:total]
		}
	}
end


ThisYear = simPath(T)

NextYearSantasPath, NextYearRoboSantasPath = T.each_char.each_with_index.group_by{ |c, i|
	i % 2
}.map{|unused, arr|
	arr.map{ |c, i| c}.join
}

NextYearSanta = simPath(NextYearSantasPath)
NextYearRoboSanta = simPath(NextYearRoboSantasPath)

puts "Task 1: %s" % ThisYear[:total].size
puts "Task 2: %s" % NextYearSanta[:total].merge(NextYearRoboSanta[:total]){ |k, v1, v2| v1 + v2 }.size

