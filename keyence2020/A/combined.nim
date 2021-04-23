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
proc `ceilDiv`*[T](x, y: T): T = x div y + ord(x mod y != 0)

proc solve(H: int, W: int, N: int): int =
  let best: int = max(H, W)
  return ceilDiv(N, best)

proc main(): void =
  var H = 0
  H = nextInt()
  var W = 0
  W = nextInt()
  var N = 0
  N = nextInt()
  echo solve(H, W, N);
  return

main()
