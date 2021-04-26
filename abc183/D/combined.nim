import sequtils
import strutils
import sugar
import algorithm
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

let YES = "Yes"
let NO = "No"
proc `$` (x: bool): string =
  if x: YES
  else: NO

proc solve(N: int, W: int, S: seq[int], T: seq[int], P: seq[int]): bool =
  var deltas: seq[tuple[t: int, x: int]]
  for i in 0..<N:
    deltas.add((t: S[i], x: P[i]))
    deltas.add((t: T[i], x: -P[i]))
  deltas.sort()
  var curx = 0
  for d in deltas:
    curx += d.x
    if curx > W:
      return false
  return true


proc main(): void =
  var N = 0
  N = nextInt()
  var W = 0
  W = nextInt()
  var S = newSeqWith(N, 0)
  var T = newSeqWith(N, 0)
  var P = newSeqWith(N, 0)
  for i in 0..<N:
    S[i] = nextInt()
    T[i] = nextInt()
    P[i] = nextInt()
  echo solve(N, W, S, T, P)
  return

main()
