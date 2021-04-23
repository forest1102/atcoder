import sequtils
import strutils
import sugar
import math
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


proc solve(N: int, K: int, S: int): string =
  const max_S = 10 ^ 9
  var arr = newSeqWith(N, 0)
  if S >= max_S:
    arr = newSeqWith(K, S).concat(newSeqWith(N-K, S-1))
  else:
    arr = newSeqWith(K, S).concat(newSeqWith(N-K, S+1))
  return arr.mapIt($it).join(" ")



proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  var S = 0
  S = nextInt()
  echo solve(N, K, S);
  return

main()
