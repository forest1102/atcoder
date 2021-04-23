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


proc solve(N:int, X:int, A:seq[int]):string =
  discard

proc main():void =
  var N = 0
    N = nextInt()
    var X = 0
    X = nextInt()
    var A = newSeqWith(N, 0)
    for i in 0..<N:
        A[i] = nextInt()
  echo solve(N, X, A);
  return

main()
