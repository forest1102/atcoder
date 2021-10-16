import sequtils, strutils, sugar, algorithm, tables
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
template `max=`*(x, y: typed): void = x = max(x, y)
template `min=`*(x, y: typed): void = x = min(x, y)
import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)

const MAX_CNT = 300
proc solve(N: int, X: int, Y: int, A: seq[int], B: seq[int]): int =
  var dp = newSeqWith(MAX_CNT + 1, newSeqWith(MAX_CNT + 1, newSeqWith(MAX_CNT +
      1, MAX_CNT + 10)))

  for i in 1..MAX_CNT:
    dp[i][0][0] = 0
    for j in 0..MAX_CNT:
      for k in 0..MAX_CNT:
        if j < A[i - 1] or k < B[i - 1]:
          dp[i][j][k] = dp[i - 1][j][k]
        if dp[i][j - A[i - 1]][k - B[i - 1]] < MAX_CNT + 10:
          dp[i][j][k].min = dp[i][j - A[i - 1]][k - B[i - 1]] + 1
        else:
          dp[i][j][k] = 1
  result = MAX_CNT + 10
  for i in 1..MAX_CNT:
    for j in 0..MAX_CNT:
      for k in 0..MAX_CNT:
        result.min = dp[i][j][k]
  if result >= MAX_CNT + 10:
    result = -1



proc main(): void =
  var N = nextInt()
  var X = nextInt()
  var Y = nextInt()
  var A = newSeqWith(N, 0)
  var B = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
    B[i] = nextInt()
  echo solve(N, X, Y, A, B)
  return

main()
