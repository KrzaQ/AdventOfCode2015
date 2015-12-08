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
		g.add_nodes(var[:line], label: "#{var[:line]}\n#{$1}")
		g.add_edges(var[:line], $2)
	when /([\w\d]+) (RSHIFT|LSHIFT|AND|OR) ([\w\d]+)/
		g.add_nodes(var[:line], label: "#{var[:line]}\n#{$2}")
		g.add_edges(var[:line], $1)
		g.add_edges(var[:line], $3)
	else
		g.add_edges(var[:line], var[:text])
	end
end

g.output(png: 'graph.png')
