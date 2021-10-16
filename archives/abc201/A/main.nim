import sequtils, strutils, algorithm
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

let YES = "Yes"
let NO = "No"

proc solve(A: var seq[int]): string =
  if A[0] == A[1] and A[1] == A[2]:
    return YES
  if A[2] - A[1] == A[1] - A[0]:
    return YES
  while A.nextPermutation():
    if A[2] - A[1] == A[1] - A[0]:
      return YES
  return NO

proc main(): void =
  var A = newSeqWith(3, 0)
  for i in 0..<3:
    A[i] = nextInt()
  echo solve(A)
  return

main()
