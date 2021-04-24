import sequtils
import strutils
import algorithm
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


proc solve(S: string): int =
  let N = S.len()
  var m = newSeqWith(N+1, 0)

  for i in 0..<N:
    if S[i] == '<':
      m[i + 1] = max(m[i + 1], m[i] + 1)
  for i in countdown(N-1, 0):
    if S[i] == '>':
      m[i] = max(m[i], m[i + 1] + 1)
  return foldl(m, a + b)







proc main(): void =
  var S = ""
  S = nextString()
  echo solve(S)
  return

main()
