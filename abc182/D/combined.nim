import sequtils
import strutils
import sugar
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

proc solve(N: int, A: seq[int]): int =
  var dp = newSeqWith(N + 1, 0)
  for i in 1..N:
    dp[i] = dp[i - 1] + A[i - 1]
  var c_max, acc = 0
  for i in 1..N:
    c_max = max(c_max, dp[i])
    acc += dp[i - 1]
    let cur = acc + c_max
    result = max(result, cur)


proc main(): void =
  let N = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
  echo solve(N, A)
  return

main()
