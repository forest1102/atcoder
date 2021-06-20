import sequtils, strutils, sugar, tables, algorithm
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



proc solve(N: int, A: var seq[int]): int =
  var ct = initCountTable[int](1 shl 20)
  result += N * (N - 1) div 2
  for a in A:
    ct.inc(a)
    result -= ct[a] - 1


proc main(): void =
  var N = nextInt()
  var A = newSeqWith(N, nextInt())
  echo solve(N, A)
  return

main()
