import sequtils, strutils, sugar, math
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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")


proc solve(N: int, T: seq[int]): int =
  result = 1
  for t in T:
    result = lcm(result, t)

proc main(): void =
  var N = 0
  N = nextInt()
  var T = newSeqWith(N, 0)
  for i in 0..<N:
    T[i] = nextInt()
  echo solve(N, T)
  return

main()
