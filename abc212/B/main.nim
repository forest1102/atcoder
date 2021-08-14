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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)



proc main():void =
  var str = nextString()
  var
    x1 = int(str[0]) - int('0')
    x2 = int(str[1]) - int('0')
    x3 = int(str[2]) - int('0')
    x4 = int(str[3]) - int('0')
  if x1 == x2 and x1 == x3 and x1 == x4:
    echo "Weak"
  elif (x1 + 1) mod 10 == x2 and ((x2 + 1) mod 10) == x3 and (x3 + 1) mod 10 == x4:
    echo "Weak"
  else:
    echo "Strong"
  return

main()
