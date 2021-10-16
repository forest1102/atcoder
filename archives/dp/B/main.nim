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

const INF = 1_000_000_000

proc solve(N: int, K: int, h: seq[int]): int =
  var dp = newSeqWith(N, 0)

  for i in 1..<N:
    dp[i] = INF
    for j in countdown(i - 1, max(i - K, 0)):
      dp[i].min = dp[j]+abs(h[j]-h[i])
  return dp[^1]

proc main(): void =
  var N = nextInt()
  var K = nextInt()
  var h = newSeqWith(N, nextInt())
  echo solve(N, K, h)
  return

main()
