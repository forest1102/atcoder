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


proc solve(W: int, H: int, N: int, x: seq[int], y: seq[int], a: seq[int]): int =
  var field = newSeqWith(H, newSeqWith(W, false))
  for t in 0..<N:
    case a[t]:
    of 1:
      for i in 0..<H:
        for j in 0..<x[t]:
          if not field[i][j]:
            field[i][j] = true
    of 2:
      for i in 0..<H:
        for j in countup(x[t], W-1):
          if not field[i][j]:
            field[i][j] = true
    of 3:
      for i in 0..<y[t]:
        for j in 0..<W:
          if not field[i][j]:
            field[i][j] = true
    of 4:
      for i in (y[t])..<H:
        for j in 0..<W:
          if not field[i][j]:
            field[i][j] = true
    else:
      echo "not found"
  for row in field:
    for d in row:
      if not d:
        inc(result)

proc main(): void =
  var W = 0
  W = nextInt()
  var H = 0
  H = nextInt()
  var N = 0
  N = nextInt()
  var x = newSeqWith(N, 0)
  var y = newSeqWith(N, 0)
  var a = newSeqWith(N, 0)
  for i in 0..<N:
    x[i] = nextInt()
    y[i] = nextInt()
    a[i] = nextInt()
  echo solve(W, H, N, x, y, a)
  return

main()
