import sequtils
import std/math
import atcoder/internal_math
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

proc solve(N, S, K: int): int =
  let
    d = gcd(gcd(N, N-S), K)
  let
    N = N div d
    S = S div d
    K = K div d

  if gcd(K, N) != 1:
    return -1
  else:
    return floorMod(inv_gcd(K, N)[1]*(N-S), N)


proc main(): void =
  let T = nextInt()
  for t in 1..T:
    let N, S, K = nextInt()
    echo solve(N, S, K)
  return

main()
