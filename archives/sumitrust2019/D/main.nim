import sequtils, strutils, algorithm
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


proc solve(N: int, S: string): int =
  const dig_range = '0'..'9'
  var table: array['0'..'9', seq[int]]
  for i, c in S.pairs:
    table[c].add(i)


  for d1 in dig_range:
    for d2 in dig_range:
      for d3 in dig_range:

        if table[d1].len == 0:
          continue
        let i1 = table[d1][0]

        if table[d2].len == 0 or table[d2][^1] <= i1:
          continue

        let i2 = table[d2][table[d2].upperBound(i1)]

        if table[d3].len == 0 or table[d3][^1] <= i2:
          continue

        inc(result)


proc main(): void =
  var N = 0
  N = nextInt()
  var S = ""
  S = nextString()
  echo solve(N, S)
  return

main()
