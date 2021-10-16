import sequtils, strutils, sugar, tables, algorithm
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


proc solve(N: int, K: int, a: seq[int], b: seq[int]): int =
  var d = initOrderedTable[int, int]()
  for i in 0..<N:
    d.mgetOrPut(a[i], 0) += b[i]

  d.sort(system.cmp, Ascending)

  var cnt = K
  for k, v in d.pairs:
    cnt -= v
    if cnt <= 0:
      return k

proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  var a = newSeqWith(N, 0)
  var b = newSeqWith(N, 0)
  for i in 0..<N:
    a[i] = nextInt()
    b[i] = nextInt()
  echo solve(N, K, a, b)
  return

main()
