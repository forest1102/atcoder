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

proc `ceilDiv`*[T](x, y: T): T = x div y + ord(x mod y != 0)
proc solve(A: int, B: int, C: int, D: int): int =
  if C*D > B:
    return ceilDiv(A, (C*D - B))
  else:
    return -1

proc main(): void =
  var A = nextInt()
  var B = nextInt()
  var C = nextInt()
  var D = nextInt()
  echo solve(A, B, C, D)
  return

main()
