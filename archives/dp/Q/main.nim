import sequtils, strutils, sugar
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
template cfor(init, comp, incr, body: untyped) =
  block:
    init
    while comp:
      body
      incr
template `max=`(x, y) = x = max(x, y)
template `min=`(x, y) = x = min(x, y)

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

import atcoder/segtree

proc solve(N: int, h: seq[int], a: seq[int]): int =
  var dp = initSegTree(N + 1, proc (a, b: int): int = max(a, b), proc(): auto = 0)
  for i in 0..<N:
    dp[h[i]] = dp[0..<h[i]] + a[i]
  return dp.all_prod()

proc main(): void =
  var N = nextInt()
  var h = newSeqWith(N, nextInt())
  var a = newSeqWith(N, nextInt())
  echo solve(N, h, a)
  return

main()
