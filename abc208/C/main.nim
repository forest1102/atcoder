import sequtils,strutils,sugar, algorithm
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
template `max=`(x, y) = x = max(x, y)
template `min=`(x, y) = x = min(x, y)

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join("\n")

proc solve(N:int, K:var int, a:seq[int]):seq[int] =
  var b = newSeqWith(N, K div N)
  K = K mod N
  for i in 0..<K:
    inc(b[i])
  var c = newSeqWith(N, (v: 0, i: 0))
  for i in 0..<N:
    c[i].v = a[i]
    c[i].i = i
  c.sort()
  result.setLen(N)
  for i in 0..<N:
    result[c[i].i] = b[i]




proc main():void =
  var N = nextInt()
  var K = nextInt()
  var a = newSeqWith(N, nextInt())
  echo solve(N, K, a)
  return

main()
