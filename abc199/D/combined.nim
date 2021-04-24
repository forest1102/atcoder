import sequtils
import strutils
import sets
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

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
var g: seq[HashSet[int]]
var visited: HashSet[int]
var num: seq[int]

proc solve(i: int, p: int): void =
  if g[i].len() > 2:
    num[i] = 0
    return

  num[i] = if p == -1: 3 else: num[p] - 1
  if num[i] < 0:
    return

  visited.incl(i)
  for k in g[i]:
    if k notin visited:
      solve(k, i)




proc main(): void =
  var N, M = nextInt()
  g.setLen(N)
  for i in 1..M:
    var a, b = nextInt() - 1
    g[a].incl(b)
    g[b].incl(a)
  num = newSeqWith(N, 3)
  solve(0, -1)
  echo foldl(num, a*b)

  return

main()
