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

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

proc meguru_search(ok, ng: int, check: proc (v: int): bool): int =
  var
    ok = ok
    ng = ng
  if not check(ok):
    return -1
  if check(ng):
    return ng
  while abs(ok - ng) > 1:
    let mid = (ok + ng) div 2
    if check(mid):
      ok = mid
    else:
      ng = mid
  return ok

proc d(n: int): int =
  var n = n
  while n > 0:
    n = n div 10
    inc(result)


proc solve(A: int, B: int, X: int): int =
  meguru_search(0, 1000_000_000, proc (n: int): bool = (A * n + B * d(n)) <= X)

proc main(): void =
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  var X = 0
  X = nextInt()
  echo solve(A, B, X)
  return

main()
