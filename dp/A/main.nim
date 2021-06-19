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


proc solve(N: int, h: seq[int]): int =
  var dp = newSeqWith(N, 0)
  dp[0] = 0
  for i in 1..<N:
    dp[i] = dp[i-1] + abs(h[i-1] - h[i])
    if i >= 2:
      dp[i].min = dp[i-2] + abs(h[i-2] - h[i])
  return dp[^1]


proc main(): void =
  var N = nextInt()
  var h = newSeqWith(N, nextInt())
  echo solve(N, h)
  return

main()
