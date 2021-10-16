import sequtils, strutils, sugar, math
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

# proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")


proc solve(N: int, h: seq[array[0..2, int]]): int =
  var dp = newSeqWith(N + 1, [0, 0, 0])

  for i in 1..N:
    for j in 0..2:
      dp[i][j] = max(
        dp[i-1][(j + 1) mod 3],
        dp[i-1][(j + 2) mod 3]
      ) + h[i - 1][j]
  return max(dp[^1])

proc main(): void =
  var N = nextInt()
  var h = newSeqWith(N, [0, 0, 0])
  for i in 0..<N:
    for j in 0..2:
      h[i][j] = nextInt()
  echo solve(N, h)
  return

main()
