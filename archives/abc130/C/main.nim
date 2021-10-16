import sequtils, strutils, sugar, strformat
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


proc solve(W: int, H: int, x: int, y: int): void =
  let area = H*W / 2
  let mult_ans =
    if 2 * x == W and 2*y == H:
      1
    else: 0
  echo area
  echo mult_ans


proc main(): void =
  var W = 0
  W = nextInt()
  var H = 0
  H = nextInt()
  var x = 0
  x = nextInt()
  var y = 0
  y = nextInt()
  solve(W, H, x, y)
  return

main()
