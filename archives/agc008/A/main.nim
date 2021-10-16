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


proc solve(x: int, y: int): int =
  if x == y:
    return 0

  if x * y == 0 and x < y:
    return abs(y-x)
  if x * y <= 0:
    return abs(x + y) + 1
  if x * y > 0:
    if x < y:
      return abs(x - y)
    if x >= y:
      return abs(x - y) + 2

proc main(): void =
  var x = 0
  x = nextInt()
  var y = 0
  y = nextInt()
  echo solve(x, y)
  return

main()
