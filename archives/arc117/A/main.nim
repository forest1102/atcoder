import sequtils, strutils, future
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


proc solve(A: int, B: int): string =
  var ans = newSeq[int](A+B)
  if A == B:
    for i in 1..A:
      ans[i-1] = i
    for i in 1..A:
      ans[A+i-1] = -i
  elif A > B:
    var rest = 0
    for i in 1..A:
      ans[i-1] = i
      rest += i
    for i in 1..<B:
      ans[A+i-1] = -i
      rest += -i
    ans[A+B-1] = -rest
  else:
    var rest = 0
    for i in 1..B:
      ans[i-1] = -i
      rest += -i
    for i in 1..<A:
      ans[B+i-1] = i
      rest += i
    ans[A+B-1] = -rest

  return ans.mapIt($it).join(" ")

proc main(): void =
  var A = 0
  A = nextInt()
  var B = 0
  B = nextInt()
  echo solve(A, B)
  return

main()
