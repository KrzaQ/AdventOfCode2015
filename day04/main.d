import std.algorithm;
import std.array;
import std.digest.md;
import std.format;
import std.range;
import std.stdio;
import std.string;

void main()
{
	auto findSolution = function ulong(immutable string s){
		return iota(ulong.min, ulong.max).find!(n => "yzbqklnj%s".format(n).md5Of.toHexString.array.startsWith(s)).front;
	};
	"Task 1: %s".format(findSolution("00000")).writeln;
	"Task 2: %s".format(findSolution("000000")).writeln;
}
