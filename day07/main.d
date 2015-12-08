import std.algorithm;
import std.array;
import std.conv;
import std.file;
import std.format;
import std.regex;
import std.stdio;
import std.string;
import std.typecons;

class Calc
{
	ushort eval(string n){
		auto ptr = n in cache;
		if(!ptr) cache[n] = lines[n].eval(this);
		return cache[n];
	}

	ushort[string] cache;
	Op[string] lines;
}

struct Op
{
	this(ushort function(ushort[]) func, string[] i){
		inputs = i;
		this.func = func;
	}

	final ushort get(string name, Calc c){
		static rx = ctRegex!`\d+`;
		if(name.match(rx)){
			return name.to!ushort;
		}
		return c.eval(name);
	}

	ushort eval(Calc c){
		return func(inputs.map!(s => get(s, c)).array);
	}

	string[] inputs;
	ushort function(ushort[]) func; 
}

void main() {
	auto c = new Calc;
	auto Data = read("data.txt").to!string.split("\n");

	foreach(l; Data){
		auto m = l.match(ctRegex!`(.+) -> (\w+)`);
		string line = m.captures[2];
		string text = m.captures[1];

		m = text.match(ctRegex!`([\d\w]+) (RSHIFT|LSHIFT|AND|OR) ([\w\d]+)`);
		if(m){
			auto arr = [m.captures[1], m.captures[3]];

			c.lines[line] = Op(m.captures[2].predSwitch(
				`RSHIFT`, function ushort(ushort[] r){ return r[0] >> r[1]; },
				`LSHIFT`, function ushort(ushort[] r){ return cast(ushort)(r[0] << r[1]); },
				`AND`, function ushort(ushort[] r){ return r[0] & r[1]; },
				`OR`, function ushort(ushort[] r){ return r[0] | r[1]; }),
				arr
			);

		}else{
			m = text.match(ctRegex!`NOT (\w+)`);
			if(m){
				c.lines[line] = Op(function ushort(ushort[] r){ return ~r[0]; }, [m.captures[1]]);
			}else{
				c.lines[line] = Op(function ushort(ushort[] r){ return r[0]; }, [text]);
			}
		}
	}

	ushort result1 = c.eval(`a`);
	c.cache = null;
	c.cache[`b`] = result1;
	ushort result2 = c.eval(`a`);

	`Task 1: %s`.format(result1).writeln;
	`Task 2: %s`.format(result2).writeln;
}
