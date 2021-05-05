import sequtils, strutils, sugar, bitops, macros, deques
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
iterator readString(): char =
  var get = false
  while true:
    var c = getchar()
    if int(c) > int(' '):
      get = true
      yield c
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

let YES = "Possible"
let NO = "Impossible"
proc `$`(x: bool): string =
  if x: YES
  else: NO

proc solve(H, W, num_sharp: int, A: seq[string]): bool =
  var q = initDeque[tuple[i: int, j: int, cnt: int]]()
  q.addLast((i: 0, j: 0, cnt: 0))
  while q.len > 0:
    var (i, j, cnt) = q.popFirst()
    if i >= H or j >= W:
      continue
    if A[i][j] == '.':
      continue
    inc(cnt)
    if (i, j) == (H-1, W-1):
      if cnt == num_sharp:
        return true
    q.addLast((i: i, j: j + 1, cnt: cnt))
    q.addLast((i: i + 1, j: j, cnt: cnt))


  return false



proc main(): void =
  var H, W = nextInt()
  var A = newSeqWith(H, "")
  var num_sharp = 0
  for i in 0..<H:
    A[i] = nextString()
    for c in A[i]:
      if c == '#':
        inc(num_sharp)
  echo solve(H, W, num_sharp, A)
  return

main()
