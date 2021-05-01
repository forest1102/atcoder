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

proc meguru_search(ok, ng: int, check: proc (v: int): bool): int =
  var
    ok = ok
    ng = ng
  while abs(ok - ng) > 1:
    let mid = (ok + ng) div 2
    if check(mid):
      ok = mid
    else:
      ng = mid
  return ok

proc solve(X: var int, Y: int, A: int, B: int): int =
  while X <= 10 ^ 18 div A and A*X <= B + X and A*X < Y:
    X *= A
    inc(result)
  result += (Y - 1 - X) div B

proc main(): void =
  var X = 0
  X = nextInt()
  var Y = 0
  Y = nextInt()
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  echo solve(X, Y, A, B)
  return

main()
