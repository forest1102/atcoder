import sequtils, strutils, sugar, math, bitops, sets
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

const M = 5
proc solve(N: int, A: seq[array[M, int]]): int =
  meguru_search(0, 10^9 + 1, proc (v: int): bool =
    var s = initSet[int]()
    for i in 0..<N:
      var x = 0
      for j in 0..<M:
        if A[i][j] >= v:
          x.setBit(j)
      s.incl(x)

    var ok = false
    for a in s:
      for b in s:
        for c in s:
          if (a or b or c) == 31:
            return true
    return false
  )


proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, [0, 0, 0, 0, 0])
  for i in 0..<N:
    for j in 0..<5:
      A[i][j] = nextInt()
  echo solve(N, A)
  return

main()
