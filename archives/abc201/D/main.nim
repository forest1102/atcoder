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
template `max=`[T](x, y: T) = x = max(x, y)
template `min=`(x, y) = x = min(x, y)

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

# proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

const INF = 1000000

proc solve(H, W: int, F: seq[string]): string =
  var
    a = newSeqWith(H, newSeqWith(W, 0))
    visited = newSeqWith(H, newSeqWith(W, false))
    memo = newSeqWith(H, newSeqWith(W, 0))

  for i in 0..<H:
    for j in 0..<W:
      a[i][j] =
        case F[i][j]:
        of '+':
          1
        of '-':
          -1
        else:
          0

  proc f(i, j: int): int =
    if i == H - 1 and j == W - 1:
      return 0
    if visited[i][j]:
      return memo[i][j]
    visited[i][j] = true
    result = -INF
    if j + 1 < W:
      result.max = a[i][j+1] - f(i, j+1)
    if i + 1 < H:
      result.max = a[i+1][j] - f(i+1, j)
    memo[i][j] = result

  let score = f(0, 0)

  if score == 0:
    return "Draw"
  if score < 0:
    return "Aoki"
  if score > 0:
    return "Takahashi"


proc main(): void =
  let H, W = nextInt()
  var F = newSeqWith(H, "")
  for i in 0..<H:
    F[i] = nextString()
  echo solve(H, W, F)
  return

main()
