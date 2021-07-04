import sequtils,strutils,sugar, math
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

# proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

import atcoder/modint
type mint = StaticModInt[1000000007]

proc solve(K:string, D:int):mint =
  let N = K.len
  var dp = newSeqWith(N + 1, newSeqWith(2, newSeqWith(D, mint(0))))
  dp[0][0][0] = 1
  for i in 0..<N:
    for j in 0..1:
      for k in 0..<D:
        let lim = if j == 1: 9 else: int(K[i]) - int('0')
        for d in 0..lim:
          dp[i + 1][ord(j == 1 or d < lim)][(k + d) mod D] += dp[i][j][k]
  return dp[N][0][0]+dp[N][1][0] - 1

proc main():void =
  var K = nextString()
  var D = nextInt()
  echo solve(K, D)
  return

main()
