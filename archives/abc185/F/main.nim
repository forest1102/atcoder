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

import atcoder/segtree

proc main(): void =
  var N, Q = nextInt()
  var A = newSeqWith(N, 0)
  for a in mitems(A):
    a = nextInt()
  var seg = initSegTree(A, proc (a: int, b: int): int = (a xor b), proc (): int = (0))

  for _ in 0..<Q:
    var t, x, y = nextInt()
    case t:
    of 1:
      seg.set(x - 1, seg.get(x - 1) xor y)
    of 2:
      echo seg.prod((x-1)..(y-1))
    else:
      discard



  return

main()
