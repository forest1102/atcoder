import sequtils,strutils,sugar
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
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
template cfor(init, comp, incr, body: untyped) =
  block:
    init
    while comp:
      body
      incr
template `max=`(x, y) = x = max(x, y)
template `min=`(x, y) = x = min(x, y)

import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)

import atcoder/modint
type mint = StaticModInt[1000000007]
const MAX_C = 1_000_000_000
proc solve(N:int, C:seq[int]):mint =
  result = 1
  for c in C:
    result *= c
  var dp = newSeqWith(N + 1, newSeqWith(MAX_C + 1, mint(0)))
  for j in 0..<dp.high:
    dp[0][j] = 1

proc main():void =
  var N = nextInt()
  var C = newSeqWith(N, nextInt())
  echo solve(N, C)
  return

main()
