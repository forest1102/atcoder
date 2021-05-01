import sequtils, strutils, sugar, tables
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

import atcoder/dsu

proc solve(N: int, M: int, dsu: var DSU): int =
  for tree in dsu.groups():
    result = max(tree.len, result)

proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var dsu = initDSU(N)
  M.times:
    var a, b = nextInt()
    dec(a)
    dec(b)
    dsu.merge(a, b)
  echo solve(N, M, dsu)
  return

main()
