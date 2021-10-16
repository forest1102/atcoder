import sequtils, strutils, sugar, tables, sets
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


proc solve(S: string): int =
  var t: array[3, HashSet[int]]
  for i, c in S.pairs:
    case c
    of 'o':
      t[0].incl(i)
    of '?':
      t[1].incl(i)
    of 'x':
      t[2].incl(i)
    else:
      discard
  if t[0].len > 4:
    return 0
  let digs = (0..9).toSeq.toHashSet() - t[2]
  for d1 in digs:
    for d2 in digs:
      for d3 in digs:
        for d4 in digs:
          var good = true
          for i in t[0]:
            if i notin {d1, d2, d3, d4}:
              good = false
              break
          if good:
            inc(result)







proc main(): void =
  var S = ""
  S = nextString()
  echo solve(S)
  return

main()
