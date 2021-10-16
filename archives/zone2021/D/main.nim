import sequtils, strutils, sugar, deques
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


proc solve(S: string): string =
  var is_reversed = false
  var q = initDeque[char]()
  for c in S:
    if c == 'R':
      is_reversed = not is_reversed
      continue
    if not is_reversed:
      if q.len > 0 and q.peekLast == c:
        q.popLast()
      else:
        q.addLast(c)
    else:
      if q.len > 0 and q.peekFirst == c:
        q.popFirst()
      else:
        q.addFirst(c)

  while q.len > 0:
    if is_reversed:
      result &= q.popLast
    else:
      result &= q.popFirst

proc main(): void =
  var S = ""
  S = nextString()
  echo solve(S)
  return

main()
