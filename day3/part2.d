import std;

int main(string[] args)
{
    if (args.length != 2)
    {
        stderr.writeln("ファイルが必要");
        return 1;
    }
    uint[] arr;
    foreach (line; File(args[1]).byLine)
    {
        uint tmp;
        auto xs = line.split("").map!(to!uint);
        // 1<<11
        // [1 0 1 0 0 0 1 1 1 1 0 0]
        //                        1<<0
        foreach (i, x; xs.enumerate)
        {
            if (x == 1)
                tmp |= 1 << (11 - i);
        }
        arr ~= tmp;
    }
    assert(arr.length == 1000);
    assert(arr[0] == 0b1010_0011_1100);

    auto oxArr = arr.dup;
    auto coArr = arr.dup;

    // 0 ~ 11
    foreach (uint i; 0 .. 12)
    {
        const mostBit = getMostBit((11 - i), oxArr);
        if (oxArr.length > 1)
            oxArr = oxArr.filter!(e => (e & (1 << (11 - i))) == (mostBit << (11 - i))).array;

        const leastBit = getMostBit((11 - i), coArr) == 1 ? 0 : 1;
        if (coArr.length > 1)
            coArr = coArr.filter!(e => (e & (1 << (11 - i))) == (leastBit << (11 - i))).array;
    }
    assert(oxArr.length == 1);
    assert(coArr.length == 1);
    writeln(oxArr[0] * coArr[0]);
    return 0;
}

int getMostBit(uint nth, uint[] arr)
{
    int bit;
    foreach (e; arr)
    {
        if ((e & (1 << nth)) == (1 << nth))
            bit++;
        else
            bit--;
    }
    return bit >= 0 ? 1 : 0;
}