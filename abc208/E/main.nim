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



proc solve(N:string, K:int):int =
  var L = N.len
  var dp = newSeqWith(L + 1, newSeqWith(2, newSeqWith(K + 1, 0)))

  for k in 0..K:
    dp[0][0][k] = 1
  for i in 0..<L:
    for j in 0..1:
      for k in 0..K:
        let lim = if j == 1: 9 else: int(N[i]) - int('0')
        for d in 0..lim:
          if k * d <= K:
            dp[i + 1][ord(j == 1 or d < lim)][k * d] += dp[i][j][k]
  echo dp[L]



proc main():void =
  var N = nextString()
  var K = nextInt()
  echo solve(N, K)
  return

main()
