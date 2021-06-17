import sequtils, strutils, sugar, algorithm, math
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
import atcoder/extra/other/max_min_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

import atcoder/extra/other/binary_search

proc main(): void =
  var N = nextInt()
  var Q = nextInt()
  var A = newSeqWith(N, nextInt())
  for _ in 0..<Q:
    var k = nextInt()
    echo minLeft(
      proc (x: int): bool =
      if x < A[0]:
        return k <= x
      var m = A.upperBound(x)
      return k <= (x - m)
    ,
      1..(2 * 10 ^ 18))
  return

main()
