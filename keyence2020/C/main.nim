import sequtils, strutils, sugar, math
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

proc print [T](arr: openArray[T]): void = echo arr.mapIt($it).join(" ")

proc solve(N: int, K: int, S: int): seq[int] =
  const max_S = 10 ^ 9
  return concat(
    newSeqWith(K, S),
    newSeqWith(N-K,
      if S >= max_S:
        S-1
      else:
        S+1
    )
  )



proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  var S = 0
  S = nextInt()
  print(solve(N, K, S))
  return

main()
