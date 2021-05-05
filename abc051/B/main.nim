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

proc C2(n: int): int =
  if n < 0:
    return 0
  else:
    return n * (n - 1) div 2

proc solve(K: int, S: int): int =
  var
    sign = 1
    c = 1
  for i in 0..(S div (K+1)):
    if i == 1 or i == 2:
      c = 3
    else:
      c = 1
    result += sign * c * (S - i * (K + 1) + 2).C2()
    sign *= -1

proc main(): void =
  var K = 0
  K = nextInt()
  var S = 0
  S = nextInt()
  echo solve(K, S)
  return

main()
