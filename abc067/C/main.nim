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

const INF = 2_000_000_000

proc solve(N: int, a: seq[int]): int =
  var x, y = 0
  result = INF
  for v in a:
    y += v

  for v in a[0..^2]:
    x += v
    y -= v
    result.min = abs(x - y)

proc main(): void =
  var N = nextInt()
  var a = newSeqWith(N, nextInt())
  echo solve(N, a)
  return

main()
