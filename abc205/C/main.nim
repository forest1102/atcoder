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
import atcoder/extra/other/max_min_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")


proc solve(A: int, B: int, C: int): string =
  return
    if C mod 2 == 0:
      if abs(A) == abs(B):
        "="
      elif abs(A) > abs(B):
        ">"
      else:
        "<"
    else:
      if A == B:
        "="
      elif A > B:
        ">"
      else:
        "<"

proc main(): void =
  var A = nextInt()
  var B = nextInt()
  var C = nextInt()
  echo solve(A, B, C)
  return

main()
