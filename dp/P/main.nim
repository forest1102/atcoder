import sequtils, strutils, sugar, tables, deques
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

import atcoder/modint
import atcoder/extra/graph/graph_template
type mint = StaticModInt[1000000007]

proc solve(N: int, x: seq[int], y: seq[int]): mint =
  var dp = initTable[int, tuple[w: mint, b: mint]]()
  var g = initGraph[int](N + 1)
  g.addBiEdge(0, 1)
  for i in 0..<(N - 1):
    g.addBiEdge(x[i], y[i])
  dp[0] = (w: mint(1), b: mint(0))
  proc f(e: Edge[int]): void =
    let
      src = e.src
      dst = e.dst
    if dst in dp:
      return
    dp[dst] = (w: mint(1), b: mint(1))

    for n in g[dst]:
      if n.dst != src:
        f(n)
        dp[dst].w *= dp[n.dst].w + dp[n.dst].b
        dp[dst].b *= dp[n.dst].w

  f(initEdge[int](0, 1))
  return dp[1].w + dp[1].b

proc main(): void =
  var N = nextInt()
  var x = newSeqWith(N-1, 0)
  var y = newSeqWith(N-1, 0)
  for i in 0..<N-1:
    x[i] = nextInt()
    y[i] = nextInt()
  echo solve(N, x, y)
  return

main()
