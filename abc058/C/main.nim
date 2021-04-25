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

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")


proc solve(n: int, S: seq[string]): string =
  const INF = 100000
  var dp: array['a'..'z', int]
  for c in low(dp)..high(dp):
    dp[c] = INF
  for s in S:
    var cur: array['a'..'z', int]
    for c in s:
      inc(cur[c])
    for c in low(dp)..high(dp):
      dp[c] = min(dp[c], cur[c])
  for c, n in dp:
    if n < INF:
      result &= repeat(char(c), n)

proc main(): void =
  var n = 0
  n = nextInt()
  var S = newSeqWith(n, "")
  for i in 0..<n:
    S[i] = nextString()
  echo solve(n, S)
  return

main()
