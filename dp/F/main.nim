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


proc solve(s: string, t: string): string =
  var dp = newSeqWith(s.len + 1, newSeqWith(t.len + 1, 0))

  for i in 1..s.len:
    for j in 1..t.len:
      if s[i - 1] == t[j - 1]:
        dp[i][j] = dp[i - 1][j - 1] + 1
      else:
        dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])

  var
    i = s.len
    j = t.len

  while i > 0 and j > 0:
    if s[i - 1] == t[j - 1]:
      result &= s[i - 1]
      dec(i)
      dec(j)
    elif dp[i][j] == dp[i - 1][j]:
      dec(i)
    else:
      dec(j)
  result.reverse()

proc main(): void =
  var s = nextString()
  var t = nextString()
  echo solve(s, t)
  return

main()
