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

proc factorize(n: int): seq[tuple[a: int, e: int]] =
  var N = n
  var a = 2
  while (a*a) <= N:
    if N mod a != 0:
      inc(a)
      continue

    var ex = 0
    while N mod a == 0:
      inc(ex)
      N = N div a

    result.add((a: a, e: ex))
    inc(a)

  if N != 1:
    result.add((a: N, e: 1))

proc solve(N: int, P: int): int =
  result = 1
  if P == 1:
    return result
  for p in factorize(P):
    var (a, e) = p
    result *= a ^ (e div N)

proc main(): void =
  var N = 0
  N = nextInt()
  var P = 0
  P = nextInt()
  echo solve(N, P)
  return

main()
