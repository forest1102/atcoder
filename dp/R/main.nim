import sequtils,strutils
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

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

import atcoder/modint
type mint = StaticModInt[1000000007]

import atcoder/extra/math/matrix
import atcoder/extra/other/internal_sugar
# import atcoder/generate_definitions
# type Matrix = seq[seq[mint]] 
# generateDefinitions(`*`, m, n, Matrix, Matrix):

proc solve(N:int, K:int, a:seq[seq[int]]):mint =
  var m = initMatrix(N, N, ()=>mint(0), () => mint(1))
  for i in 0..<N:
    for j in 0..<N:
      m[i][j] = a[i][j]
  m = m ^ K
  for i in 0..<N:
    for j in 0..<N:
      result += m[i][j]
proc main():void =
  var N = nextInt()
  var K = nextInt()
  var a = newSeqWith(N, newSeqWith(N, nextInt()))
  echo solve(N, K, a)
  return

main()
