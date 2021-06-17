import sequtils, strutils, sugar, sets
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
import atcoder/extra/other/max_min_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

let YES = "Yes"
let NO = "No"

proc solve(N: int, A: seq[int]): string =
  var s = initHashSet[int]()
  for a in A:
    if a notin s:
      s.incl(a)
    else:
      return NO
  return YES

proc main(): void =
  var N = nextInt()
  var A = newSeqWith(N, nextInt())
  echo solve(N, A)
  return

main()
