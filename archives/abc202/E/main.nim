import sequtils, strutils, sugar
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
template `max=`(x, y) = x = max(x, y)
template `min=`(x, y) = x = min(x, y)

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

import atcoder/extra/graph/graph_template

proc solve(N: int, P: seq[int], Q: int, U: seq[int], D: seq[int]): string =
  var g = initGraph[int](N)
  for src, dst in P:
    g.addBiEdge(src + 1, dst)



proc main(): void =
  var N = nextInt()
  var P = newSeqWith(N-2+1, nextInt() - 1)
  var Q = nextInt()
  var U = newSeqWith(Q, 0)
  var D = newSeqWith(Q, 0)
  for i in 0..<Q:
    U[i] = nextInt() - 1
    D[i] = nextInt()
  echo solve(N, P, Q, U, D)
  return

main()
