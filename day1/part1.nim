import std/parseutils

var counter = 0
var first = true
var prev = 0
for line in "input.txt".lines:
  if first:
    doAssert parseInt(line, prev) != 0
    first = false
  else:
    var n: int
    doAssert parseInt(line, n) != 0
    if n > prev:
      counter += 1
    prev = n
echo counter
