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

include atcoder/extra/math/eratosthenes

iterator enum_divisors(e: Eratosthenes, n: int): int =
  var n = n
  while n > 1:
    yield n
    n = n div e.pdiv[n]
  yield 1

proc euler(e: Eratosthenes, n: int): int =
  result = n
  for (p, e) in e.factor(n):
    result *= p - 1
    result = result div p


proc solve(L: int, R: int): int =
  result += R - L + 1
  var erat = initEratosthenes(R + 1)
  for y in L..R:
    for v in erat.enum_divisors(y):
      if v < L:
        break
      dec(result)
    result -= erat.euler(y) - L

proc main(): void =
  var L = nextInt()
  var R = nextInt()
  echo solve(L, R)
  return

main()
