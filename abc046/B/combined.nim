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


proc solve(N: int, K: int): int =
  return K * (K-1) ^ (N - 1)

proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  echo solve(N, K)
  return

main()
