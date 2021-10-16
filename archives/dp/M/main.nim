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


import atcoder/modint
type mint = StaticModInt[1000000007]

proc solve(N: int, K: int, a: seq[int]): mint =
  var
    dp = newSeqWith(N + 1, newSeqWith(K + 1, mint(0)))

  dp[0][0] = 1

  for i in 1..N:
    var cum = newSeqWith(K + 2, mint(0))
    for j in 1..(K+1):
      cum[j] = cum[j - 1] + dp[i - 1][j - 1]
    for j in 0..K:
      dp[i][j] = cum[j + 1] - cum[max(0, j - a[i])]

  return dp[N][K]



proc main(): void =
  var N = nextInt()
  var K = nextInt()
  var a = @[0] & newSeqWith(N, nextInt())
  echo solve(N, K, a)
  return

main()
