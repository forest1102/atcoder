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


proc solve(N: int, K: int, a: seq[int]): string =
  var dp = newSeqWith(K + 1, false)
  for k in 0..K:
    dp[k] = a.anyIt(k >= it and not dp[k - it])

  if dp[K]:
    "First"
  else:
    "Second"

proc main(): void =
  var N = nextInt()
  var K = nextInt()
  var a = newSeqWith(N, nextInt())
  echo solve(N, K, a)
  return

main()
