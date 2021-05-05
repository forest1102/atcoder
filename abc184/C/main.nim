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


proc solve(s, g: tuple[x: int, y: int]): int =
  var (r, c) = (x: g.x - s.x, y: g.y - s.y)
  if (r, c) == (0, 0):
    return 0
  if abs(r) + abs(c) <= 3:
    return 1
  if r + c == 0 or r - c == 0:
    return 1
  if abs(r) + abs(c) <= 6:
    return 2
  if (r + c) mod 2 == 0:
    return 2
  if abs(r + c) <= 3 or abs(r - c) <= 3:
    return 2
  return 3


proc main(): void =
  var
    s = (x: nextInt(), y: nextInt())
    g = (x: nextInt(), y: nextInt())
  echo solve(s, g)
  return

main()
