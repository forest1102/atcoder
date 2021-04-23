import sequtils
import strutils
import sugar
import algorithm
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

proc meguru_search [T](ng: T, ok: T, check: proc (x: T): bool): T =
  var
    ng = ng
    ok = ok
  while abs(ng-ok) > 1:
    let mid = (ok+ng) div 2;
    if check(mid):
      ok = mid
    else:
      ng = mid
  return ok


proc solve(N: int, X: seq[int], L: seq[int]): int =
  var ps = newSeqWith(N, (0, 0))
  for i in 0..<N:
    ps[i] = (X[i]+L[i], X[i]-L[i])
  ps.sort()
  var cur = -1000000000

  for s in ps:
    if cur <= s[1]:
      inc(result)
      cur = s[0]






proc main(): void =
  var N = 0
  N = nextInt()
  var X = newSeqWith(N, 0)
  var L = newSeqWith(N, 0)
  for i in 0..<N:
    X[i] = nextInt()
    L[i] = nextInt()
  echo solve(N, X, L);
  return

main()
