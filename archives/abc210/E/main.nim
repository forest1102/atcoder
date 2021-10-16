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
import atcoder/extra/graph/graph_template
import atcoder/extra/graph/prim
import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(N: int, M: int, A: seq[int], C: seq[int]): int =
  var g = initGraph(N)
  for i in 0..<N:
    g.addBiEdge(i, (i + A[i]) mod N, C[i])
  return prim(g)[0]


proc main(): void =
  var N = nextInt()
  var M = nextInt()
  var A = newSeqWith(M, 0)
  var C = newSeqWith(M, 0)
  for i in 0..<M:
    A[i] = nextInt()
    C[i] = nextInt()
  echo solve(N, M, A, C)
  return

main()
