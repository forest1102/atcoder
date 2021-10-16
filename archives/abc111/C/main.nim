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

const INF = 1000_000

proc solve(n: int, v: seq[int]): int =
  var cnts: array[2, CountTable[int]]
  for i in 0..<n:
    cnts[i mod 2].inc(v[i])

  var cnts_seq: array[2, seq[tuple[num: int, v: int]]]

  for i in 0..1:
    for p in cnts[i].pairs:
      cnts_seq[i].add((num: p[1], v: p[0]))
    cnts_seq[i].sort(Descending)

  if cnts_seq[0][0].v != cnts_seq[1][0].v:
    return n - cnts_seq[0][0].num - cnts_seq[1][0].num
  if cnts_seq[0].len == 1 and cnts_seq[1].len == 1:
    return n div 2

  result = INF
  if cnts_seq[0].len > 1:
    result.min = n - cnts_seq[0][1].num - cnts_seq[1][0].num
  if cnts_seq[1].len > 1:
    result.min = n - cnts_seq[0][0].num - cnts_seq[1][1].num








proc main(): void =
  var n = 0
  n = nextInt()
  var v = newSeqWith(n, 0)
  for i in 0..<n:
    v[i] = nextInt()
  echo solve(n, v)
  return

main()
