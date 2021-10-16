import sequtils, strutils, sugar, rationals
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


proc solve(N: int, D: float, H: float, d: seq[float], h: seq[float]): float =
  var res: float = 0
  for i in 0..<N:
    var val = ((h[i]-H) / (D-d[i]))*D+H
    res = max(res, val)
  return res

proc main(): void =
  var N = 0
  N = nextInt()
  var D = 0
  D = nextInt()
  var H = 0
  H = nextInt()
  var d = newSeqWith(N, 0.0)
  var h = newSeqWith(N, 0.0)
  for i in 0..<N:
    d[i] = nextInt().toFloat()
    h[i] = nextInt().toFloat()
  echo solve(N, D.toFloat(), H.toFloat(), d, h)
  return

main()
