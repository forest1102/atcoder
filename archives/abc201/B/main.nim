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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")


proc solve(N: int, table: var seq[tuple[t: int, s: string]]): string =
  table.sort(system.cmp, order = Descending)
  return table[1].s

proc main(): void =
  var N = 0
  N = nextInt()
  var table = newSeqWith(N, (t: 0, s: ""))
  for i in 0..<N:
    let
      s = nextString()
      t = nextInt()
    table[i] = ((t: t, s: s))
  echo solve(N, table)
  return

main()
