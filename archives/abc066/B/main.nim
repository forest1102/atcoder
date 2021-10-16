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

proc check(S: string): bool = (S.len() mod 2 == 0 and S[0..<(S.len() div 2)] ==
    S[(S.len() div 2)..high(S)])

proc solve(S: string): int =
  let N = S.len()
  for i in countdown(N - 1, 0):
    if check(S[0..<i]):
      return i
  return 0

proc main(): void =
  var S = ""
  S = nextString()
  echo solve(S)
  return

main()
