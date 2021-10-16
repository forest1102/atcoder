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

import atcoder/extra/other/warlus_operator
import atcoder/extra/graph/graph_template
import atcoder/extra/graph/dijkstra

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)

proc main():void =
  let N, Q = nextInt()
  var g = initGraph[int](N)
  (N - 1).times:
    let a, b = nextInt() - 1
    g.addBiEdge(a, b)
  let dist = dijkstra[int](g, 0)[0]
  Q.times:
    let c,d = nextInt() - 1
    if (dist[c] + dist[d]) mod 2 == 0:
      echo "Town"
    else:
      echo "Road"
  return

main()
