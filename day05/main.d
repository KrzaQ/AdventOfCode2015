import std.algorithm;
import std.conv;
import std.file;
import std.format;
import std.regex;
import std.stdio;
import std.string;

bool rxTest(string rx)(string s){
	return cast(bool)s.matchFirst(ctRegex!(rx));
}

void main()
{
	immutable data = read("data.txt").to!string.split("\n");

	"Task 1: %s".format(data.filter!(l => rxTest!"(?:[aeuio].*){3}"(l) && rxTest!"(.)\\1"(l) && !rxTest!"ab|cd|pq|xy"(l)).count).writeln;
	"Task 2: %s".format(data.filter!(l => rxTest!"(..).*\\1"(l) && rxTest!"(.).\\1"(l)).count).writeln;
}
