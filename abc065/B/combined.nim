import sequtils
import strutils
import sugar
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


proc solve(N: int, a: seq[int]): int =
  var visited = newSeqWith(N, false)
  var cur = 0
  while true:
    visited[cur] = true
    cur = a[cur]
    inc(result)
    if cur == 1:
      return
    if visited[cur]:
      return -1



proc main(): void =
  var N = 0
  N = nextInt()
  var a = newSeqWith(N, 0)
  for i in 0..<N:
    a[i] = nextInt()-1
  echo solve(N, a)
  return

main()
