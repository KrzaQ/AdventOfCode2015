T = File.read('data.txt').lines.map{|l| l.strip.each_char.map{|c| c == '#' ? 1 : 0 } }

def count(arr, x, y)
	# p [x, y]
	ret = 0
	ret = ret + arr[y-1][x-1] unless x == 0 or y == 0
	ret = ret + arr[y][x-1] unless x == 0
	ret = ret + arr[y+1][x-1] unless x == 0 or y == arr.size - 1
	ret = ret + arr[y-1][x] unless y == 0
	ret = ret + arr[y+1][x] unless y == arr.size - 1
	ret = ret + arr[y-1][x+1] unless y == 0 or x == arr[y-1].size - 1 
	ret = ret + arr[y][x+1] unless x == arr[y].size - 1
	ret = ret + arr[y+1][x+1] unless y == arr.size - 1 or x == arr[y+1].size - 1
	ret
end

def nextStep(arr)
	(0...arr.size).map{ |y|
		(0...arr[y].size).map { |x|
			around = count(arr, x, y)
			(around == 3 or (around == 2 and arr[y][x] == 1)) ? 1 : 0
		}
	} 
end

def gen(input)
	Enumerator.new do |y|
		cur = input
		loop do
			y << cur
			cur = nextStep(cur)
		end
	end
end

p gen(T).lazy.drop(100).first.inject(0){|t,c| t + c.inject(0){|t,c| t + c}}
