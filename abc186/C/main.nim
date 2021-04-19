import sequtils
import atcoder/math
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
proc has7in(a: int, base: int): bool =
  var n = a
  while n > 0:
    if n mod base == 7:
      return true
    n = n div base;
  return false


proc solve(N: int): void =
  var ans = N
  for i in 1..N:
    if i.has7in(8) or i.has7in(10):
      dec(ans)
  echo ans
  return

proc main(): void =
  var N = 0
  N = nextInt()


  solve(N);
  return

main()
