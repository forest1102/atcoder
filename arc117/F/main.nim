import sequtils
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


proc solve(N:int, A:seq[int]):void =
  discard

proc main():void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(2*N-1-0+1, 0)
  for i in 0..<2*N-1-0+1:
    A[i] = nextInt()
  solve(N, A);
  return

main()
