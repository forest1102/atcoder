import sequtils,strutils,sugar
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
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

import atcoder/modint
import atcoder/extra/dp/cumulative_sum
type mint = StaticModInt[1000000007]

proc solve(N:int, s:string):mint =
  var dp = newSeqWith(N, newSeqWith(N, mint(0)))

  for j in 0..<N:
    dp[0][j] = 1

  for i in 1..<N:
    var cumsum = initCumulativeSum(dp[i - 1])
    for less in 0..<(N-i):
      if s[i - 1] == '<':
        dp[i][less] = cumsum[0..less]
      else:
        dp[i][less] = cumsum[(less+1)..<N]
  return dp[N - 1][0]



proc main():void =
  var N = nextInt()
  var s = nextString()
  echo solve(N, s)
  return

main()
