import sequtils, strutils, sugar, algorithm
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


proc solve(N: int, L: var seq[int]): int =
  L.sort()
  for i, a in L:
    for j in (i+1)..<N:
      var b = L[j]
      let k = L.lowerBound(a+b) - 1
      if k > j:
        result += (k - j)

proc main(): void =
  var N = 0
  N = nextInt()
  var L = newSeqWith(N, 0)
  for i in 0..<N:
    L[i] = nextInt()
  echo solve(N, L)
  return

main()
