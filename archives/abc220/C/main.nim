import sequtils,strutils,sugar, algorithm, tables
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
import atcoder/extra/other/binary_search
import atcoder/extra/dp/cumulative_sum

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `///`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(N:int, A:seq[int], X:int):int =
  var sum = A.foldl(a + b)
  var P = X div sum
  var sumb = P * sum
  var ans = P * N

  for a in A:
    sumb += a
    ans.inc
    if sumb > X:
      return ans
  

proc main():void =
  var N = nextInt()
  var A = newSeqWith(N, nextInt())
  var X = nextInt()
  echo solve(N, A, X)
  return

main()
