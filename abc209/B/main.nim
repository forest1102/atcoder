import sequtils,strutils,sugar
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
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

import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)

let YES = "Yes"
let NO = "No"

proc solve(N:int, X:var int, A:seq[int]):string =

  for i in 0..<N:
    if (i + 1) mod 2 == 0:
      X -= (A[i] - 1)
    else:
      X -= A[i]
  if X >= 0:
    YES
  else:
    NO

proc main():void =
  var N = nextInt()
  var X = nextInt()
  var A = newSeqWith(N, nextInt())
  echo solve(N, X, A)
  return

main()
