import sequtils,strutils,sugar, algorithm, tables, heapqueue
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


proc solve(start:string, K:int):string =
  var S = start.sorted().join("")
  var hq = initHeapQueue[string]()
  hq.push(S)
  while S.nextPermutation():
    hq.push(S)
  hq.push(S)
  (K - 1).times:
    var s = hq.pop()
  return hq[0]


proc main():void =
  var S = nextString()
  var K = nextInt()
  echo solve(S, K)
  return

main()
