import sequtils,strutils,sugar, algorithm, tables, bitops
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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)


proc solve(N:var int):auto =
  result = ""

  while N > 0:
    if not N.testBit(0):
      N = N shr 1
      result &= 'B'
    else:
      N = N - 1
      result &= 'A'
  result.reverse()



proc main():void =
  var N = nextInt()
  echo solve(N)
  return

main()
