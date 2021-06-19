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

import atcoder/modint
type mint = StaticModInt[1000000007]

proc solve(H: int, W: int, a: seq[string]): mint =
  var dp = newSeqWith(H, newSeqWith(W, mint(0)))

  dp[0][0] = 1
  for i in 1..<H:
    if a[i][0] == '.':
      dp[i][0] = dp[i - 1][0]
  for j in 1..<W:
    if a[0][j] == '.':
      dp[0][j] = dp[0][j - 1]

  for i in 1..<H:
    for j in 1..<W:
      if a[i][j] == '#':
        dp[i][j] = 0
      else:
        dp[i][j] = dp[i][j - 1] + dp[i - 1][j]

  return dp[^1][^1]
proc main(): void =
  var H = nextInt()
  var W = nextInt()
  var a = newSeqWith(H, nextString())
  echo solve(H, W, a)
  return

main()
