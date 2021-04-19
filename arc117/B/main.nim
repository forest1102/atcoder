import sequtils, algorithm
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

import atcoder/modint
type mint = StaticModInt[1000000007]

proc solve(N: int, A: var seq[int]): int =
  A.sort()
  var ans = mint(1)
  for i in 1..<A.len():
    ans *= (A[i] - A[i-1] + 1)
  return ans.val()

proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N+1, 0)
  A[0] = 0
  for i in 1..N:
    A[i] = nextInt()
  echo solve(N, A)
  return

main()
