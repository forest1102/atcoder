import sequtils, strutils, sugar, tables
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

# proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")


proc solve(N: int, a: seq[int]): float =
  var c: array[1..3, int]
  for k in a:
    inc(c[k])
  var
    dp = initTable[array[1..3, int], float]()

  proc f(c: array[1..3, int]): float =
    if c in dp:
      return dp[c]
    if c[1] == 0 and c[2] == 0 and c[3] == 0:
      return 0.0

    result = (float)N
    if c[1] > 0:
      result += (float)(c[1]) * f([c[1] - 1, c[2], c[3]])
    if c[2] > 0:
      result += (float)(c[2]) * f([c[1] + 1, c[2] - 1, c[3]])
    if c[3] > 0:
      result += (float)(c[3]) * f([c[1], c[2] + 1, c[3] - 1])
    result /= (float)(c[1] + c[2] + c[3])
    dp[c] = result

  return f(c)


proc main(): void =
  var N = nextInt()
  var a = newSeqWith(N, nextInt())
  echo solve(N, a)
  return

main()
