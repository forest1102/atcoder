import sequtils, strutils, sugar, algorithm
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


proc solve(N: int, T: var seq[int]): int =
  var sum = 0
  for t in T:
    sum += t

  var dp = newSeqWith(N + 1, newSeqWith(sum + 1, false))

  for i in 0..N:
    dp[i][0] = true

  for i in 1..N:
    for j in 1..sum:
      dp[i][j] = dp[i - 1][j]

      if T[i - 1] <= j:
        dp[i][j] = dp[i][j] or dp[i-1][j - T[i-1]]

  for j in countdown((sum div 2), 0):
    if dp[N][j]:
      return max(sum - j, j)

proc main(): void =
  var N = nextInt()
  var T = newSeqWith(N, nextInt())
  echo solve(N, T)
  return

main()
