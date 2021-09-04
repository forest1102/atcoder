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

let YES = "Yes"
let NO = "No"
import atcoder/extra/graph/graph_template


proc solve(N,M: int,a:seq[seq[int]], k: seq[int]): string = 
  var g = initGraph(N)
  for i in 0..<M:
    for j in 1..<k[i]:
      g.addEdge(a[i][j - 1],a[i][j]) 

  var seen = newSeqWith(N, false)
  var depature = newSeqWith(N, 0)
  var time = 0
  proc dfs(v: int): void =
    seen[v] = true
    for nv in g.adj_by_id(v):
      if not seen[nv.dst]:
        dfs(nv.dst)
    depature[v] = time
    time.inc
  for i in 0..<N:
    if not seen[i]:
      dfs(i)
  for u in 0..<N:
    for v in g.adj_by_id(u):
      if depature[u] <= depature[v.dst]:
        return NO
  return YES

proc main():void =
  var 
    N = nextInt()
    M = nextInt()
    k = newSeqWith(M, 0)
    a = newSeqWith(M, newSeq[int]())
  for i in 0..<M:
    k[i] = nextInt()
    a[i].setLen(k[i])
    for j in 0..<k[i]:
      a[i][j] = nextInt() - 1
  echo solve(N,M,a,k)
  return

main()
