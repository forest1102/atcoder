import sequtils, strutils, sugar, algorithm
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


proc solve(N: int, C: int, K: int, T: var seq[int]): int =
  T.sort()
  var i = 0
  while i < N:
    let r = T[i] + K
    C.times:
      if i >= N or T[i] > r:
        break
      inc(i)
    inc(result)

proc main(): void =
  var N = 0
  N = nextInt()
  var C = 0
  C = nextInt()
  var K = 0
  K = nextInt()
  var T = newSeqWith(N, 0)
  for i in 0..<N:
    T[i] = nextInt()
  echo solve(N, C, K, T)
  return

main()
