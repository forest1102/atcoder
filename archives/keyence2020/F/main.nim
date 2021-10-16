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

type mint = StaticModInt[998244353]

proc solve(H:int, W:int, A:seq[string]):string =
  discard

proc main():void =
  var H = 0
    H = nextInt()
    var W = 0
    W = nextInt()
    var A = newSeqWith(H, "")
    for i in 0..<H:
        A[i] = nextString()
  echo solve(H, W, A);
  return

main()
