import sequtils, strutils, sugar, algorithm, tables
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
template `max=`*(x, y: typed): void = x = max(x, y)
template `min=`*(x, y: typed): void = x = min(x, y)
import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)

import atcoder/extra/structure/set_map

proc solve(L: int, Q: int, c: seq[int], x: seq[int]): void =
  var s = initSortedSet(int)
  s.insert(L)
  s.insert(0)
  for i in 0..<Q:
    if c[i] == 1:
      s.insert(x[i])
    else:
      echo s
      var target = s.lower_bound(x[i])
      echo target.succ.key, " ", target.key


proc main(): void =
  var L = nextInt()
  var Q = nextInt()
  var c = newSeqWith(Q, 0)
  var x = newSeqWith(Q, 0)
  for i in 0..<Q:
    c[i] = nextInt()
    x[i] = nextInt()
  solve(L, Q, c, x)
  return

main()
