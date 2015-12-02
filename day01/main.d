import std.array;
import std.algorithm;
import std.conv;
import std.string;
import std.format;
import std.file;
import std.stdio;

void main()
{
	int context;
	immutable data = read("data.txt").to!string.map!(c => context += c.predSwitch('(', 1, ')', -1, 0)).array;

	"Task 1: %s".format(data.back).writeln;

	"Task 2: %s".format(data.countUntil(-1)+1).writeln;
}