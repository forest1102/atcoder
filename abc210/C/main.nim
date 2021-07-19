import sequtils, strutils, sugar, tables, sets
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
import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(N: int, K: int, c: seq[int]): int =
  var sets = initHashSet[int]()
  var cnts = initTable[int, int](1 shl 17)
  for i in 0..<N:
    sets.incl(c[i])
    inc(cnts.mgetOrPut(c[i], 0))
    if i >= K:
      if cnts.mgetOrPut(c[i - K], 0) > 0:
        dec(cnts.mgetOrPut(c[i - K], 0))
      if cnts.getOrDefault(c[i - K], 0) <= 0:
        sets.excl(c[i - K])
    result = max(result, sets.len)


proc main(): void =
  var N = nextInt()
  var K = nextInt()
  var c = newSeqWith(N, nextInt())
  echo solve(N, K, c)
  return

main()
