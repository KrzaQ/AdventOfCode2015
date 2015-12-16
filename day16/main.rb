Sue = { children: 3, cats: 7, samoyeds: 2, pomeranians: 3, akitas: 0, vizslas: 0, goldfish: 5, trees: 3, cars: 2, perfumes: 1}
S = File.read('data.txt')
.scan(/Sue (\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)/)
.map{|arr| arr[1..-1].each_slice(2).inject({sue: arr.first.to_i}){|t, a| t[a.first.to_sym] = a.last.to_i; t}}

def sueMatchesPartial(sue, partial, matchFun) sue.all?{|k,v| send(matchFun, sue, partial, k)} end

def match1(sue, partial, k) sue[k] == partial.fetch(k, sue[k]) end

def match2(sue, partial, k)
	case k
	when :cats, :trees
		sue[k] < partial.fetch(k, sue[k]+1)
	when :pomeranians, :goldfish
		sue[k] > partial.fetch(k, sue[k]-1)
	else
		match1(sue, partial, k)
	end
end	

puts 'Task 1: %s' %  S.select{|s| sueMatchesPartial(Sue, s, :match1)}.first[:sue]
puts 'Task 2: %s' %  S.select{|s| sueMatchesPartial(Sue, s, :match2)}.first[:sue]
