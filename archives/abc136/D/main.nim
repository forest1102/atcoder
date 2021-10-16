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
proc `ceilDiv`*[T](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(S: string): seq[int] =
  let N = S.len
  var c = newSeqWith(N, 0)
  result = newSeqWith(N, 0)
  var cnt = 0
  for i in 0..<N:
    if S[i] == 'R':
      inc(cnt)
    else:
      if cnt > 0:
        c[i - 1] = cnt
        cnt = 0

  for i in countdown(N - 1, 0):
    if S[i] == 'L':
      inc(cnt)
    else:
      if cnt > 0:
        c[i + 1] = cnt
        cnt = 0
  var f = 1
  for i in 0..<(N - 1):
    if c[i] == 0:
      continue

    if f > 0:
      let
        r_c = c[i].ceilDiv(2) + c[i + 1].floorDiv(2)
        r_n = c[i].floorDiv(2) + c[i + 1].ceilDiv(2)

      result[i] = r_c
      result[i + 1] = r_n
      f = 1 xor f
    else:
      f = 1 xor f


proc main(): void =
  var S = ""
  S = nextString()
  echo solve(S)
  return

main()
