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


proc solve(N:int, c:seq[string]):void =
  discard

proc main():void =
  var N = 0
  N = nextInt()
  var c = newSeqWith(1, "")
  for i in 0..<1:
    c[i] = nextString()
  solve(N, c);
  return

main()
