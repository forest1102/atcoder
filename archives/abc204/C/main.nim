import sequtils, strutils, sugar, deques, tables
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


proc solve(N: int, M: int, A: seq[int], B: seq[int]): int =
  var graph = initTable[int, seq[int]]()

  for i in 0..<M:
    graph.mgetOrPut(A[i] - 1, @[]).add(B[i] - 1)

  for s in 0..<N:
    var visited = newSeqWith(N, false)
    var q = initDeque[int]()
    q.addLast(s)
    visited[s] = true

    while q.len > 0:
      var e = q.popFirst
      visited[e] = true
      for n in graph.getOrDefault(e, @[]):
        if not visited[n]:
          q.addFirst(n)
    for b in visited:
      if b:
        inc(result)

proc main(): void =
  var N = nextInt()
  var M = nextInt()
  var A = newSeqWith(M, 0)
  var B = newSeqWith(M, 0)
  for i in 0..<M:
    A[i] = nextInt()
    B[i] = nextInt()
  echo solve(N, M, A, B)
  return

main()
