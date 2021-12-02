import std;

int main(string[] args)
{
    if (args.length != 2)
    {
        stderr.writeln("ファイルが必要");
        return 1;
    }
    int horizontalPos = 0;
    int aim = 0;
    int depth = 0;
    foreach (line; File(args[1]).byLine)
    {
        auto arr = line.split(' ');
        auto key = cast(immutable) arr[0];
        switch (key)
        {
        case "forward":
            auto n = arr[1].to!int;
            horizontalPos += n;
            depth += aim * n;
            break;
        case "down":
            aim += arr[1].to!int;
            break;
        case "up":
            aim -= arr[1].to!int;
            break;
        default:
            assert(false);
        }
    }
    stderr.writeln(horizontalPos * depth);
    return 0;
}