import sequtils, strutils, sugar, tables
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
import atcoder/extra/other/max_min_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

import atcoder/extra/dp/cumulative_sum

const INF = 1000_000_000_000

proc solve(N: int, a: seq[int]): int64 =
  var
    cumsum = initCumulativeSum(a)
    dp = initTable[tuple[l, r: int], int64]()

  proc f(l, r: int): int64 =
    if (l, r) in dp:
      return dp[(l, r)]
    if l == r:
      return 0
    result = -1
    for k in l..<r:
      if result != -1:
        result <?= f(l, k) + f(k + 1, r)
      else:
        result = f(l, k) + f(k + 1, r)
    result += cumsum[l..r]
    dp[(l, r)] = result
  return f(1, N)


proc main(): void =
  var N = nextInt()
  var a = @[0] & newSeqWith(N, nextInt())
  echo solve(N, a)
  return

main()
