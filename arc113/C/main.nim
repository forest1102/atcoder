import sequtils, strutils, sugar, algorithm
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
template cfor(init, comp, incr, body: untyped) =
  block:
    init
    while comp:
      body
      incr
template `max=`(x, y) = x = max(x, y)
template `min=`(x, y) = x = min(x, y)

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")


proc solve(S: var string): int =
  let N = S.len
  S.reverse()
  var cnts: array['a'..'z', int]

  for i in 0..<(N - 1):
    if S[i] == S[i + 1]:
      result += i - cnts[S[i]]
      for c in cnts.mitems:
        c = 0
      cnts[S[i]] = i + 1
    else:
      inc(cnts[S[i]])


proc main(): void =
  var S = ""
  S = nextString()
  echo solve(S)
  return

main()
