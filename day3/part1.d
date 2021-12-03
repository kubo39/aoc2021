import std;

int main(string[] args)
{
    if (args.length != 2)
    {
        stderr.writeln("ファイルが必要");
        return 1;
    }
    auto arr = new int[](12);
    foreach (line; File(args[1]).byLine)
    {
        auto xs = line.split("").map!(to!int);
        assert(xs.length == 12);
        foreach (i, x; xs.enumerate)
        {
            if (x == 1)
                arr[i]++;
            else
                arr[i]--;
        }
    }
    int gamma;
    int epsilon;
    foreach_reverse (i, x; arr.enumerate)
    {
        if (x > 0)
            gamma |= 1 << (11 - i);
        else
            epsilon |= 1 << (11 - i);
    }
    writeln(gamma * epsilon);
    return 0;
}