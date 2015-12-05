import std.algorithm;
import std.array;
import std.conv;
import std.file;
import std.format;
import std.regex;
import std.string;
import std.stdio;

void main()
{
	const data = read("data.txt")
		.to!string
		.split("\n")
		.map!(l => l.matchFirst(ctRegex!"(\\d+)x(\\d+)x(\\d+)"))
		.map!(m => [m[1], m[2], m[3]].map!(to!int).array.sort)
		.array;

	"Task 1: %s".format(data.map!(a => 3*a[0]*a[1] + 2*a[0]*a[2] + 2*a[1]*a[2]).sum).writeln;
	"Task 2: %s".format(data.map!(a => 2*a[0]+2*a[1] + a.reduce!((a,b) => a*b)).sum).writeln;
}