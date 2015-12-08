class Calc
	def method_missing(line)
		# p line
		return $1.to_s.to_i if /line_(\d+)/ =~ line
		-1
	end

	def calc_or(a,b)
		self.send(a) | self.send(b)
	end
	
	def calc_and(a,b)
		self.send(a) & self.send(b)
	end
	
	def calc_lshift(a,b)
		self.send(a) << self.send(b) % 65536
	end
	
	def calc_rshift(a,b)
		self.send(a) >> self.send(b)
	end

	def reset_cache
		@cache = {}
	end

	def manual_cache_override(name, value)
		@cache[name] = value
	end

end

calc = Calc.new
calc.reset_cache

D = File.read('data.txt')
.lines
.map{ |l|
	/(.+) -> (\w+)/.match l
}
.map{ |m|
	{
		text: m[1],
		line: m[2]
	}
}

D.each do |var|
	line = var[:line]
	text = '%s' % var[:text]

	def name(x)
		'line_%s' % x
	end

	case text
	when /(NOT) ([\w\d]+)/
		r  = $2
		calc.class.send(:define_method, name(line)) do
			@cache[line] = ~self.send(name(r)) + 65536 unless @cache.has_key? line
			@cache[line]
		end
	when /([\w\d]+) (RSHIFT|LSHIFT|AND|OR) ([\w\d]+)/
		op = $2.downcase
		l = $1
		r = $3
		calc.class.send(:define_method, name(line)) do
			@cache[line] = self.send("calc_%s" % op, name(l), name(r)) unless @cache.has_key? line
			@cache[line]
		end
	else
		r = text
		calc.class.send(:define_method, name(line)) do
			@cache[line] = self.send(name(r)) unless @cache.has_key? line
			@cache[line]
		end
	end
end


FirstResult = calc.line_a

puts 'Task 1: %s' % FirstResult

calc.reset_cache
calc.manual_cache_override('b', FirstResult)

SecondResult = calc.line_a

puts 'Task 2: %s' % SecondResult
