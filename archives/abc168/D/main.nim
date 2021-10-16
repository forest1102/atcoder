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

let YES = "Yes"

proc solve(N: int, M: int, graph: Table[int, seq[int]]): void =
  var result = newSeqWith(N, -1)
  var q = initDeque[tuple[p: int, c: int]]()

  q.addLast((p: -1, c: 0))

  while q.len > 0:
    var (p, c) = q.popFirst()

    if result[c] != -1:
      continue
    if p != -1:
      result[c] = p + 1

    for next in graph[c]:
      if p != next:
        q.addLast((p: c, c: next))
  for k in result[1..^1]:
    if k == -1:
      echo "No"
      return

  echo YES
  for k in result[1..^1]:
    echo k


proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var graph = initTable[int, seq[int]]()
  for i in 0..<M:
    let a, b = nextInt() - 1
    graph.mgetOrPut(a, @[]).add(b)
    graph.mgetOrPut(b, @[]).add(a)
  solve(N, M, graph)
  return

main()
