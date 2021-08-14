import sequtils,strutils,sugar, algorithm, tables, deques
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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(N:int, A:seq[int], B:seq[int]):string =
  var g = newSeqWith(N + 1, newSeq[int]())
  for i in 0..<N-1:
    g[A[i]].add(B[i])
    g[B[i]].add(A[i])
  for i in 0..N:
    g[i].sort()
  var res = newSeq[int]()
  proc dfs(crr,pre: int):void =
    res.add(crr)
    for nxt in g[crr]:
      if nxt != pre:
        dfs(nxt,crr)
        res.add(crr)
  dfs(1,-1)
  echo res.join(" ") & " "


proc main():void =
  var N = nextInt()
  var A = newSeqWith(N-1, 0)
  var B = newSeqWith(N-1, 0)
  for i in 0..<N-1:
    A[i] = nextInt()
    B[i] = nextInt()
  echo solve(N, A, B)
  return

main()
