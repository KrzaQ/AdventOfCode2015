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
	IOp[string] lines;
}

interface IOp
{
	ushort eval(Calc);

	final ushort get(string name, Calc c){
		static rx = ctRegex!`\d+`;
		if(name.match(rx)){
			return name.to!ushort;
		}
		return c.eval(name);
	}
}

class Op(alias T) : IOp
{
	this(string[] i){
		inputs = i;
	}

	ushort eval(Calc c){
		return T(inputs.map!(s => get(s, c)).array).to!ushort;
	}
	
	string[] inputs;
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
			switch(m.captures[2]){
				case `RSHIFT`: c.lines[line] = new Op!(r => r[0] >> r[1])([m.captures[1], m.captures[3]]); break;
				case `LSHIFT`: c.lines[line] = new Op!(r => r[0] << r[1])([m.captures[1], m.captures[3]]); break;
				case `AND`: c.lines[line] = new Op!(r => r[0] & r[1])([m.captures[1], m.captures[3]]); break;
				case `OR`: c.lines[line] = new Op!(r => r[0] | r[1])([m.captures[1], m.captures[3]]); break;
				default: assert(0);
			}
		}else{
			m = text.match(ctRegex!`NOT (\w+)`);
			if(m){
				c.lines[line] = new Op!(r => ~r[0])([m.captures[1]]);
			}else{
				c.lines[line] = new Op!(r => r[0])([text]);
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
