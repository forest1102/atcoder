import sequtils, strutils, deques
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

proc mazeLen(H, W: int, field: var seq[string]): int =
  var q = initDeque[tuple[x: int, y: int, cnt: int]]()
  q.addFirst((x: 0, y: 0, cnt: 0))
  while q.len > 0:
    var p = q.popFirst()
    if p.x < 0 or p.y < 0:
      continue
    if p.x >= H or p.y >= W:
      continue
    if field[p.x][p.y] != '.':
      continue

    inc(p.cnt)
    field[p.x][p.y] = '*'
    if p.x == H - 1 and p.y == W - 1:
      return p.cnt

    for dr in [(x: -1, y: 0), (x: 1, y: 0), (x: 0, y: -1), (x: 0, y: 1)]:
      q.addLast((x: p.x + dr.x, y: p.y + dr.y, cnt: p.cnt))
  return -1

proc solve(H, W: int, field: var seq[string]): int =
  var res = mazeLen(H, W, field)
  if res == -1:
    return -1

  result = H*W - res

  for row in field:
    for c in row:
      if c == '#':
        dec(result)





proc main(): void =
  let H, W = nextInt()
  var field = newSeqWith(H, "")
  for s in mitems(field):
    s = nextString()
  echo solve(H, W, field)
  return

main()
