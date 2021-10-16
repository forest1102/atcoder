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

proc C2(n: int): int =
  if n < 0:
    return 0
  else:
    return n * (n - 1) div 2

proc count_num(S, L: int): int =
  var
    sign = 1
    c = 1
  for i in 0..min((S div (L+1)), 3):
    if i == 1 or i == 2:
      c = 3
    elif i == 0 or i == 3:
      c = 1
    else:
      c = 0
    result += sign * c * (S - i * (L + 1) + 2).C2()
    sign *= -1

proc solve(N: var int, K: var int): seq[int] =
  result = newSeqWith(3, 0)
  var S = 3 * N
  var f = 0
  for k in 0..(3 * N + 3):
    f += count_num(k, N - 1)
    if f > K:
      S = k - 1
      f -= count_num(k, N - 1)
      break
  echo S
  var c = 0
  var g = 0
  for k in 0..<N:
    g += min(S - k + 1, 2 * N - 1 - S + k)
    if f + g >= K:
      c = k
      break
  echo c





proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  echo solve(N, K)
  return

main()
