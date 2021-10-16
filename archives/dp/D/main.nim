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


proc solve(N: int, W: int, w: seq[int], v: seq[int]): int =
  var dp = newSeqWith(N+1, newSeqWith(W + 1, 0))

  for i in 1..N:
    for j in 1..W:
      dp[i][j] = dp[i - 1][j]
      if j >= w[i]:
        dp[i][j].max = dp[i-1][j-w[i]] + v[i]
  return dp[N][W]

proc main(): void =
  var N = nextInt()
  var W = nextInt()
  var w = newSeqWith(N+1, 0)
  var v = newSeqWith(N+1, 0)
  for i in 1..N:
    w[i] = nextInt()
    v[i] = nextInt()
  echo solve(N, W, w, v)
  return

main()
