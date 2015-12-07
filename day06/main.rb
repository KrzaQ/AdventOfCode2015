
D = File.read('data.txt')
.lines
.map{ |l|
	/([\w\s]+) (\d+),(\d+) through (\d+),(\d+)/.match l
}.map{ |m|
	{
		action: case m[1]
		when 'turn on'
			:on
		when 'turn off'
			:off
		when 'toggle'
			:toggle
	end,
		from: [m[2].to_i, m[3].to_i],
		to: [m[4].to_i, m[5].to_i]
	}
}

lightsTask1 = (0...1000).map{ [0] * 1000 }.to_a
lightsTask2 = (0...1000).map{ [0] * 1000 }.to_a

D.each do |order|
	fx, fy = order[:from]
	tx, ty = order[:to]
	(fx..tx).each do |x|
		(fy..ty).each do |y|
			lightsTask1[y][x] = case order[:action]
			when :on
				1
			when :off
				0
			when :toggle
				1 - lightsTask1[y][x]
			end

			currentValue = lightsTask2[y][x]
			lightsTask2[y][x] = case order[:action]
			when :on
				currentValue + 1
			when :off
				[currentValue - 1, 0].max
			when :toggle
				currentValue + 2
			end
		end
	end
end

puts "Task 1: %d" % lightsTask1.map{|l| l.inject(:+)}.inject(:+)
puts "Task 2: %d" % lightsTask2.map{|l| l.inject(:+)}.inject(:+)