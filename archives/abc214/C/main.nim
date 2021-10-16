import sequtils,strutils,sugar, algorithm, tables,math
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
template `max=`*(x,y:typed):void = x = max(x,y)
template `min=`*(x,y:typed):void = x = min(x,y)
import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)

import atcoder/modint

proc solve(N:int, S:seq[int], T:seq[int]):void=
  var start = 0
  var c = 2_000_000_000
  for i in 0..<N:
    if T[i] < c:
      c = T[i]
      start = i
  var dp = newSeqWith(N, 0)
  type mint = DynamicModInt[0]
  mint.setMod(N)
  var i = mint.init(start)

  dp[i.val] = T[i.val]
  for _ in 1..<N:
    i.inc
    dp[i.val] = min(dp[(i-1).val] + S[(i-1).val], T[i.val])
  echo dp.join("\n")

proc main():void =
  var N = nextInt()
  var S = newSeqWith(N, nextInt())
  var T = newSeqWith(N, nextInt())
  solve(N, S, T)
  return

main()
