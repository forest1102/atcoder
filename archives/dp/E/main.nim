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

proc solve(N: int, V: int, W: int, w: seq[int], v: seq[int]): int =
  var dp = newSeqWith(N + 1, newSeqWith(V + 1, INF))

  dp[0][0] = 0

  for i in 1..N:
    for j in 0..V:
      dp[i][j] = dp[i-1][j]
      if j >= v[i]:
        dp[i][j].min = dp[i-1][j - v[i]] + w[i]

  for j in countdown(V, 0):
    if dp[N][j] <= W:
      return j


proc main(): void =
  var N = nextInt()
  var W = nextInt()
  var V = 0
  var w = newSeqWith(N+1, 0)
  var v = newSeqWith(N+1, 0)
  for i in 1..N:
    w[i] = nextInt()
    v[i] = nextInt()
    V += v[i]
  echo solve(N, V, W, w, v)
  return

main()
