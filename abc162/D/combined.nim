import sequtils
import strutils
import sugar
import tables
import algorithm
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld", addr result)
proc nextFloat(): float = scanf("%lf", addr result)
proc nextString(): string =
  var get = false
  result = ""
  while true:
    var c = getchar()
    if int(c) > int(' '):
      get = true
      result.add(c)
    else:
      if get: break
      get = false


proc solve(N: int, S: string): int =
  var dp = {'R': newSeq[int](), 'G': newSeq[int](), 'B': newSeq[int]()}.toTable()
  for i, s in S:
    dp[s].add(i+1)
  for r in dp['R']:
    for g in dp['G']:
      let B = dp['B']
      result += B.len()
      if (r+g) mod 2 == 0 and B.binarySearch((r+g) div 2) != -1:
        dec(result)
      if B.binarySearch(2*r-g) != -1:
        dec(result)
      if B.binarySearch(2*g-r) != -1:
        dec(result)





proc main(): void =
  var N = 0
  N = nextInt()
  var S = ""
  S = nextString()
  echo solve(N, S)
  return

main()
