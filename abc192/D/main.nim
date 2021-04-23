import sequtils,strutils,sugar
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


proc solve(X:string, M:int):string =
  discard

proc main():void =
  var X = ""
    X = nextString()
    var M = 0
    M = nextInt()
  echo solve(X, M);
  return

main()
