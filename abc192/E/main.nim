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


proc solve(N: int, M: int, X: int, Y: int, A: seq[int], B: seq[int], T: seq[
    int], K: seq[int]): string =
  discard

proc main(): void =
  var N = 0
  N = nextInt()
  var M = 0
  M = nextInt()
  var X = 0
  X = nextInt()
  var Y = 0
  Y = nextInt()
  var A = newSeqWith(M, 0)
  var B = newSeqWith(M, 0)
  var T = newSeqWith(M, 0)
  var K = newSeqWith(M, 0)
  for i in 0..<M:
    A[i] = nextInt()
    B[i] = nextInt()
    T[i] = nextInt()
    K[i] = nextInt()
  echo solve(N, M, X, Y, A, B, T, K);
  return

main()
