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

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
import atcoder/modint
type mint = StaticModInt[1000000007]

proc solve(N: int, M: int): mint =
  if abs(M - N) > 1:
    return 0
  else:
    result = 1
    if M == N:
      result = 2
    for i in 1..N:
      result *= i
    for i in 1..M:
      result *= i


proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  echo solve(N, M)
  return

main()
