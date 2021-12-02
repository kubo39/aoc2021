import std/parseutils
import std/sequtils
import std/sugar

var counter = 0
let xs = collect:
  for line in "input.txt".lines:
    var n: int
    doAssert parseInt(line, n) != 0
    n

for i, _ in xs[0 .. xs.len()-4]:
  if xs[i] < xs[i+3]:
    counter += 1
echo counter
