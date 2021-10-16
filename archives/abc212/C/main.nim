import sequtils,strutils,sugar, algorithm, tables
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
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
template `max=`*(x,y:typed):void = x = max(x,y)
template `min=`*(x,y:typed):void = x = min(x,y)
proc minLeft*(f:proc(x:int):bool, s:Slice[int]):int =
  var (l, r) = (s.a - 1, s.b)
  if not f(r): return s.b + 1
  while r - l > 1:
    let d = (r - l) shr 1
    let m = l + d
    if f(m): r = m
    else: l = m
  return r

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(N:int, M:int, A:seq[int], B:var seq[int]):int =
  B.sort()
  result = 2000_000_000
  for i in 0..<N:
    var j = B.upperBound(A[i])
    if j < M:
      result.min= abs(A[i] - B[j])
    if j > 0:
      result.min=abs(A[i] - B[j - 1])

proc main():void =
  var N = nextInt()
  var M = nextInt()
  var A = newSeqWith(N, nextInt())
  var B = newSeqWith(M, nextInt())
  echo solve(N, M, A, B)
  return

main()
