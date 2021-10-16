import sequtils, strutils, sugar, tables
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


proc solve(N: int, a: seq[int]): int =
  var dp = initTable[tuple[i, j: int], int]()
  proc f(i, j: int): int =
    if i == j:
      return a[i]
    if i > j:
      return 0
    if (i, j) in dp:
      return dp[(i, j)]
    result = max(a[i] - f(i+1, j), a[j] - f(i, j-1))
    dp[(i, j)] = result
  return f(0, N - 1)


proc main(): void =
  var N = nextInt()
  var a = newSeqWith(N, nextInt())
  echo solve(N, a)
  return

main()
