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
import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(H:int, W:int, N:int, A:seq[int], B:seq[int]):void =
  var 
    A_sorted = A.sorted().deduplicate(isSorted=true)
    B_sorted = B.sorted().deduplicate(isSorted=true)

  for i in 0..<N:
    var x = A_sorted.lower_bound(A[i]) + 1
    var y = B_sorted.lower_bound(B[i]) + 1
    echo $x & " " & $y

proc main():void =
  var H = nextInt()
  var W = nextInt()
  var N = nextInt()
  var A = newSeqWith(N, 0)
  var B = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt()
    B[i] = nextInt()
  solve(H, W, N, A, B)
  return

main()
