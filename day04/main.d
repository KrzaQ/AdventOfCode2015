import std.algorithm;
import std.array;
import std.digest.md;
import std.format;
import std.range;
import std.stdio;
import std.string;

void main()
{
	"Task 1: %s".format(iota(ulong.min, ulong.max).find!(n => "yzbqklnj%s".format(n).md5Of.toHexString.array.startsWith("00000")).front).writeln;
	"Task 2: %s".format(iota(ulong.min, ulong.max).find!(n => "yzbqklnj%s".format(n).md5Of.toHexString.array.startsWith("000000")).front).writeln;
}
