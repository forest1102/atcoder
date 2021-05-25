import sequtils, strutils, algorithm
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


proc solve(A: int, B: int, K: var int): string =
  result = repeat('a', A + B)

  for i in countdown(B - 1, 0):
    var
      j = 0
      c = 1
    while (K > c) and (i + j < A + B):
      K -= c
      inc(j)
      c = (i + j) * c div j
    result[i + j] = 'b'
  result.reverse()


proc main(): void =
  var A = nextInt()
  var B = nextInt()
  var K = nextInt()
  echo solve(A, B, K)
  return

main()
