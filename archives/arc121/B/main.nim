import sequtils, strutils, algorithm, math
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


proc solve(N: int, a: seq[int], c: seq[string]): int =
  var table: array[3, seq[int]]
  const INF = 10 ^ 17
  # for i in 0..2:
  #   table[i] = (minv: INF, l: 0)
  for i in 0..<(2*N):
    case c[i]:
    of "R":
      table[0].add(a[i])
    of "G":
      table[1].add(a[i])
    of "B":
      table[2].add(a[i])
    else:
      discard

  var pos = {0, 1, 2}

  for i in 0..2:
    table[i].sort()
    if table[i].len mod 2 == 0:
      pos.excl(i)
  
  if pos.len == 0:
    return 0
  
  result = INF
  for i in pos:
    for j in pos:
      if i != j:
        var idx = table[i].upperBound(table[j][0])
        if idx >= 1:
          result.min=abs(table[i][idx - 1] - table[j][0])
        if idx + 1 < table[i].len:
          result.min = abs(table[i][idx+1]-table[j][0])




proc main(): void =
  var N = nextInt()
  var a = newSeqWith(2*N, 0)
  var c = newSeqWith(2*N, "")
  for i in 0..<2*N:
    a[i] = nextInt()
    c[i] = nextString()
  echo solve(N, a, c)
  return

main()
