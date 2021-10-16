import sequtils, strutils, sugar
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld", addr result)
proc nextFloat(): float = scanf("%lf", addr result)
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

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")



proc main(): void =
  var
    N = nextInt()
    S = nextString()
    Q = nextInt()
  var swapped = false
  for i in 1..Q:
    var t, a, b = nextInt()
    dec(a)
    dec(b)
    case t:
    of 1:
      if swapped:
        a = if a >= N: a - N else: a + N
        b = if b >= N: b - N else: b + N
      swap(S[a], S[b])
    of 2:
      swapped = not swapped
    else:
      discard

  if swapped:
    echo S[N..<(2*N)] & S[0..<N]
  else:
    echo S



  return

main()
