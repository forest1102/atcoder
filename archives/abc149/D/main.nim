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

type HANDS = enum
  Rock
  Scissor
  Paper

proc solve(N: int, K: int, R: int, S: int, P: int, T: string): int =
  var points: array[HANDS, array[HANDS, int]]
  points[Rock][Scissor] = R
  points[Scissor][Paper] = S
  points[Paper][Rock] = P
  var enemies = newSeqWith(N, Rock)
  for i in 0..<N:
    enemies[i] = case T[i]
      of 'r': Rock
      of 's': Scissor
      of 'p': Paper
      else: Rock
  for start in 0..<K:
    var dp: array[HANDS, int]
    for i in countup(start, N - 1, K):
      let
        e = enemies[i]
        cur = [
          max(dp[Scissor], dp[Paper]) + points[Rock][e],
          max(dp[Rock], dp[Paper]) + points[Scissor][e],
          max(dp[Rock], dp[Scissor]) + points[
            Paper][e]]
      dp = cur
    result += max(dp)



proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  var R = 0
  R = nextInt()
  var S = 0
  S = nextInt()
  var P = 0
  P = nextInt()
  var T = ""
  T = nextString()
  echo solve(N, K, R, S, P, T)
  return

main()
