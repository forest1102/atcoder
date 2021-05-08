import sequtils, strutils, sugar, sets
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

import atcoder/modint
type mint = StaticModInt[1000000007]

proc solve(N: int, M: int, a: HashSet[int]): mint =
  var dp = newSeqWith(N + 1, mint(0))

  dp[0] = 1
  for i in 1..N:
    if i in a:
      dp[i] = 0
    else:
      if i == 1:
        dp[i] = dp[i - 1]
      else:
        dp[i] = dp[i - 2] + dp[i - 1]
  # echo dp
  return dp[^1]

proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var a = initHashSet[int]()
  for i in 0..<M:
    a.incl(nextInt())
  echo solve(N, M, a)
  return

main()
