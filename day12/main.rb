require 'json'
T = File.read('data.txt')

def red_is_bad(input)
	case input
	when Hash
		return {} if input.any?{|k,v| v == 'red'}
		input.map{|k,v| [k, red_is_bad(v)]}.to_h
	when Array
		input.map{|v| red_is_bad(v)}
	else
		input
	end
end

puts 'Task 1: %s' % T.scan(/(-?\d+)/).map{|n| n[0].to_i }.inject(:+)
puts 'Task 2: %s' % red_is_bad(JSON.parse(T)).to_json.scan(/(-?\d+)/).map{|n| n[0].to_i }.inject(:+)
