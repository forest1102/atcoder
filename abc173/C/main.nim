import sequtils, strutils, sugar, bitops
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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

proc solve(H, W, K: int, C: seq[string]): int =
  for b in 0..<(1 shl H):
    for c in 0..<(1 shl W):
      var cur = 0
      for i in 0..<H:
        if b.testBit(i):
          continue
        for j in 0..<W:
          if c.testBit(j):
            continue
          if C[i][j] == '#':
            inc(cur)
      if cur == K:
        inc(result)

proc main(): void =
  var H, W, K = nextInt()
  var C: seq[string] = newSeqWith(H, "")
  for i in 0..<H:
    C[i] = nextString()
  echo solve(H, W, K, C)
  return

main()
