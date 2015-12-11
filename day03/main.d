import std.algorithm;
import std.conv;
import std.container;
import std.file;
import std.format;
import std.functional;
import std.range;
import std.stdio;
import std.string;

auto pointSum(L,R)(L l, R r)
{
	return zip(l[], r[]).map!(t => t[0] + t[1]).array;
}

auto simulatePath(Input)(Input input)
{
	auto data = redBlackTree!(int[2])([0,0]);
	int[2] current = [0,0];
	foreach(move; input){
		current = pointSum(current, move);
		data.insert(current);
	}
	return data;
}

void main()
{
	auto Data = read("data.txt").to!string.map!(c => c.predSwitch('^', [0,1], '>', [1,0], 'v', [0,-1], '<', [-1,0])).array;

	"Task 1: %s".format(Data.simulatePath.length).writeln;
	auto Santa = Data.stride(2).simulatePath;
	auto RoboSanta = Data.dropOne.stride(2).simulatePath;
	Santa.insert(RoboSanta[]);
	"Task 2: %s".format(Santa.length).writeln;

}