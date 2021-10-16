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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)
const INF = 2000_000_000_000
import atcoder/lazysegtree
proc main():void =
  var Q = nextInt()
  var seg = initLazySegTree(Q, 
  proc(i0,i1:int64): int64 = min(i0,i1), 
  proc ():auto = INF,
  proc(x: int, s: int64): int64 = x + s, 
  proc (x1,x2: int): int= x1 + x2, 
  proc (): int=  0)
  for i in 0..<Q:
    var p = nextInt()
    case p
    of 1:
      var x = nextInt()
      seg[i] = int64(x)
    of 2:
      var x = nextInt()
      seg.apply(0..i, x)
    of 3:
      var x = seg[0..i]
      echo x
      var d = seg.min_left(i, proc(y: int64): bool = (y >= x))
      seg[d] = INF
    else:
      discard
  return

main()
