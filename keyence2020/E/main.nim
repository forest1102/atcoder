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


proc solve(N:int, M:int, D:seq[int], U:seq[int], V:seq[int]):string =
  discard

proc main():void =
  var N = 0
    N = nextInt()
    var M = 0
    M = nextInt()
    var D = newSeqWith(N, 0)
    for i in 0..<N:
        D[i] = nextInt()
    var U = newSeqWith(M, 0)
    var V = newSeqWith(M, 0)
    for i in 0..<M:
        U[i] = nextInt()
        V[i] = nextInt()
  echo solve(N, M, D, U, V);
  return

main()
