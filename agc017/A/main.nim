import sequtils, strutils, math
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

proc solve(N: int, P: int, cnts: array[2, int]): int =
  var com = newSeqWith(cnts[1] + 1, newSeqWith(cnts[1] + 1, 0))
  com[0][0] = 1
  for i in 1..cnts[1]:
    com[i][0] = 1
    for j in 1..cnts[1]:
      com[i][j] = (com[i - 1][j - 1] + com[i - 1][j])
  if P == 0:
    for i in countup(0, 2 * (cnts[1] div 2), 2):
      result += com[cnts[1]][i]
  else:
    if cnts[1] > 0:
      for i in countup(1, 2 * ((cnts[1] - 1) div 2) + 1, 2):
        result += com[cnts[1]][i]
  result *= 2 ^ cnts[0]


proc main(): void =
  var N = 0
  N = nextInt()
  var P = 0
  P = nextInt()
  var cnts = [0, 0]
  for i in 0..<N:
    inc(cnts[nextInt() mod 2])
  echo solve(N, P, cnts)
  return

main()
