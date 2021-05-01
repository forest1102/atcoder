import sequtils
import strutils
import sugar
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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")



proc main(): void =
  var N = 0
  N = nextInt()
  var Q = 0
  Q = nextInt()
  var S = ""
  S = nextString()
  var dp = newSeqWith(N, 0)

  for i in 1..<N:
    dp[i] = dp[i-1]
    if S[(i-1)..i] == "AC":
      inc(dp[i])

  for i in 0..<Q:
    let l, r = nextInt() - 1
    echo dp[r] - dp[l]
  return

main()
