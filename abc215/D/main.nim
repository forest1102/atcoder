import sequtils,strutils,sugar, algorithm, tables, sets
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

import atcoder/extra/math/eratosthenes

proc solve(N:int, M:int, A:seq[int]):void =
  var e = initEratosthenes(100_001)
  var primes_set = initHashSet[int]()
  for a in A:
    for (p,_) in e.factor(a):
      primes_set.incl(p)
  var res = newSeq[int]()
  for i in 1..M:
    var is_coprime = true
    for p in primes_set:
      if i mod p == 0:
        is_coprime = false
        break
    if is_coprime:
      res.add(i)
  echo res.len
  for k in res:
    echo k


  



proc main():void =
  var N = nextInt()
  var M = nextInt()
  var A = newSeqWith(N, nextInt())
  solve(N, M, A)
  return

main()
