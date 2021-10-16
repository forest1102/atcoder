import sequtils, strutils, sugar, algorithm, tables
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
template `max=`*(x, y: typed): void = x = max(x, y)
template `min=`*(x, y: typed): void = x = min(x, y)

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(X: string, N: int, S: seq[string]): string =
  var map = initTable[char, int]()
  for i, x in X:
    map[x] = i + 1

  proc mycmp(a, b: int): int =
    for i in 0..<min(S[a].len, S[b].len):
      if S[a][i] != S[b][i]:
        return map[S[a][i]] - map[S[b][i]]
    return S[a].len - S[b].len
  var A = toSeq(0..<N).sorted(
    mycmp
  )

  for a in A:
    echo S[a]

proc main(): void =
  var X = nextString()
  var N = nextInt()
  var S = newSeqWith(N, nextString())
  echo solve(X, N, S)
  return

main()
