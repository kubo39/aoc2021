import std.algorithm;
import std.array;
import std.conv : to;
import std.functional;
import std.range;
import std.stdio;

int main(string[] args)
{
    if (args.length != 2)
    {
        stderr.writeln("ファイルが必要");
        return 1;
    }
    File(args[1]).byLine
        .map!(a => a.to!int)
        .array
        .slide(3)
        .map!(arr => arr.sum)
        .slide(2)
        .count!(arr => greaterThan(arr[1], arr[0]))
        .writeln;
    return 0;
}