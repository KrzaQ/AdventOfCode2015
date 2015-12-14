D = File.read('data.txt')
.scan(/(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds/)
.map{|name, speed, time, rest| {name: name, speed: speed.to_i, time: time.to_i, rest: rest.to_i} }

def distanceTravelledAfter(reindeer, seconds)
	cycle = reindeer[:time] + reindeer[:rest]
	speed = reindeer[:speed]
	full, partial = seconds / cycle, seconds % cycle
	full * reindeer[:time] * speed + [partial * speed, reindeer[:time] * speed].min
end

puts 'Task 1: %s' % D.map{|r| distanceTravelledAfter r, 2503}.max
puts 'Task 2: %s' % (1..2503).map{ |n|
	dists = D.map{|r| distanceTravelledAfter r, n}
	dists.map{|d| (d.to_f/dists.max).to_i}
}.inject([0] * D.size){ |t, c| t.zip(c).map{|a,b| a+b}}.max
