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

iterator primes(N: int): int =
  var N = N
  cfor((var i = 2), i * i <= N, inc(i)):
    if N mod i == 0:
      while N mod i == 0:
        N = N div i
      yield i
  if N != 1:
    yield N

proc solve(A: var int, B: int): int =
  inc(result)
  if A == 1 or B == 1:
    return
  for p in primes(A):
    if B mod p == 0:
      inc(result)

proc main(): void =
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  echo solve(A, B)
  return

main()
