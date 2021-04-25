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

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

iterator divisors(N: int): int =
  var i = 1
  while i*i < N:
    if N mod i == 0:
      yield i
    inc(i)
  while i >= 1:
    if N mod i == 0:
      yield N div i
    dec(i)


proc solve(X: int): string =
  for k in divisors(X):
    var b = - (k div 2)
    while 5*(b^4) + 10 * (b^3) * k + 10*(b^2)*(k^2) + 5*b*(k^3) + (k^4) < (X div k):
      inc(b)
    if 5*(b^4) + 10 * (b^3) * k + 10*(b^2)*(k^2) + 5*b*(k^3) + (k^4) == (X div k):
      return $(b+k) & " " & $b




proc main(): void =
  var X = 0
  X = nextInt()
  echo solve(X)
  return

main()
