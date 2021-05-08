import sequtils, strutils, bitops
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


proc main(): void =
  var N, M = nextInt()

  var l = newSeqWith(M, newSeq[int]())
  for i in 0..<M:
    let k = nextInt()
    l[i] = newSeqWith(k, 0)
    for j in l[i].mitems:
      j = nextInt() - 1
  var p = newSeqWith(M, nextInt())
  var res = 0
  for b in 0..<(1 shl N):
    var cnt = 0
    for i in 0..<M:
      var flag = 0
      for j in l[i]:
        if b.testBit(j):
          flag = flag xor 1
      if flag == p[i]:
        inc(cnt)
    if cnt == M:
      inc(res)
  echo res

  return

main()
