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


proc solve(N: int, A: seq[int], B: seq[int]): int =
  let max_A = max(A)
  let min_B = min(B)
  if max_A > min_B:
    return 0
  else:
    return min_B - max_A + 1


proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
  var B = newSeqWith(N, 0)
  for i in 0..<N:
    B[i] = nextInt()
  echo solve(N, A, B)
  return

main()
