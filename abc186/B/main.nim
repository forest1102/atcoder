import sequtils
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



proc main(): void =
  var H = 0
  H = nextInt()
  var W = 0
  W = nextInt()
  var a_min = 1000
  var A = newSeqWith(H, newSeqWith(W, 0))
  for i in 0..<H:
    for j in 0..<W:
      A[i][j] = nextInt()
      a_min = min(A[i][j], a_min)
  var ans = 0
  for a_i in A:
    for a in a_i:
      ans += a-a_min
  echo ans
  return

main()
