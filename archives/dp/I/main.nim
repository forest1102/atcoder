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

proc `$` [T](x: seq[seq[T]]): string = x.mapIt($it).join("\n")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)

proc solve(N: int, p: seq[float]): float =
  var dp = newSeqWith(N + 1, newSeqWith(N + 1, 0.0))
  dp[0][0] = 1.0
  for i in 1..N:
    for j in countdown(i, 0):
      dp[i][j] += dp[i - 1][j] * (1 - p[i - 1])
      if j >= 1:
        dp[i][j] += dp[i - 1][j - 1] * p[i - 1]
  for i in ceilDiv(N, 2)..N:
    result += dp[N][i]

proc main(): void =
  var N = nextInt()
  var p = newSeqWith(N, nextFloat())
  echo solve(N, p)
  return

main()
