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

proc solve(N: int, M: int, graph: Graph[int]): int =
  var
    dp = newSeqWith(N, 0)
    flag = newSeqWith(N, false)
  proc f(x: int): int =
    if flag[x]:
      return dp[x]
    flag[x] = true
    for y in graph[x]:
      result.max = f(y.dst) + 1
    dp[x] = result

  for i in 0..<N:
    result.max = f(i)


proc main(): void =
  var N = nextInt()
  var M = nextInt()
  var graph = initGraph[int](N)
  for i in 0..<M:
    graph.addEdge(nextInt() - 1, nextInt() - 1, 1)
  echo solve(N, M, graph)
  return

main()
