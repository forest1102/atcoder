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



proc main(): void =
  var N, M = nextInt()
  var dp = newSeqWith(N + 1, newSeqWith(N + 1, 0))
  for x in 1..N:
    for y in 1..N:
      dp[x][y] = dp[x - 1][y]

  return

main()
