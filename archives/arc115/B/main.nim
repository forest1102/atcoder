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

let YES = "Yes"
let NO = "No"

proc solve(N: int, C: var seq[seq[int]]): void =
  var
    b1 = 0
    A = newSeqWith(N, 0)
    B = newSeqWith(N, 0)
  for j in 0..<N:
    b1 = max(b1, C[0][0] - C[0][j])
    for i in 1..<N:
      if (C[i-1][j]-C[i-1][0]) != (C[i][j]-C[i][0]):
        echo NO
        return
  for i in 0..<N:
    A[i] = C[i][0] - b1
  for j in 0..<N:
    B[j] = b1 - C[0][0] + C[0][j]
  echo YES
  echo A.mapIt($it).join(" ")
  echo B.mapIt($it).join(" ")
  return


proc main(): void =
  var N = 0
  N = nextInt()
  var C = newSeqWith(N, newSeqWith(N, 0))
  for i in 0..<N:
    for j in 0..<N:
      C[i][j] = nextInt()
  solve(N, C)
  return

main()
