import sequtils, strutils, sugar, heapqueue, algorithm
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


proc solve(N: int, A: seq[int], B: seq[int]): int =
  var req, s_extra = 0
  var extras: seq[int]

  for i in 0..<N:
    if A[i] > B[i]:
      s_extra += A[i] - B[i]
      extras.add(A[i] - B[i])
    elif A[i] < B[i]:
      req += B[i] - A[i]
      inc(result)
  if req > s_extra:
    return -1
  extras.sort(Descending)
  for extra in extras:
    if req <= 0:
      return result
    req -= extra
    inc(result)


proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
  var B = newSeqWith(N, 0)
  for i in 0..<N:
    B[i] = nextInt()
  echo solve(N, A, B)
  return

main()
