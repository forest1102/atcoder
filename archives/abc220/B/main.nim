import sequtils,strutils,sugar, algorithm, tables, math
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


proc solve(K:int, A:int, B:int):int=
  var t = A
  var i = 0
  var a = 0
  while t > 0:
    a +=  (t mod 10) * K^i
    i.inc
    t = t div 10
  var b = 0
  t = B
  i = 0
  while t > 0:
    b +=  (t mod 10) * K^i
    i.inc
    t = t div 10
  return a * b

proc main():void =
  var K = nextInt()
  var A = nextInt()
  var B = nextInt()
  echo solve(K, A, B)
  return

main()
