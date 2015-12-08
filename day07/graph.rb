require 'ruby-graphviz'

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

g = GraphViz.new( :G, :type => :digraph )

D.each do |var|
	p var
	case var[:text]
	when /(NOT) ([\w\d]+)/
		g.add_nodes(var[:line], label: "#{var[:line]}\n#{var[:text]}")
		g.add_edges(var[:line], $2)
		# p ['->', $2]
	when /([\w\d]+) (RSHIFT|LSHIFT|AND|OR) ([\w\d]+)/
		l, r = $1, $3
		# p [l,r]
		g.add_nodes(var[:line], label: "#{var[:line]}\n#{var[:text]}")
		g.add_edges(var[:line], l) unless /\d+/ =~ l
		g.add_edges(var[:line], r) unless /\d+/ =~ r
	when /\w+/
		g.add_edges(var[:line], var[:text]) unless /\d+/ =~ var[:text]
		g.add_nodes(var[:line], label: "#{var[:line]}\n#{var[:text]}")
	end
end

g.output(png: 'graph.png')
