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
template cfor(init, comp, incr, body: untyped) =
  block:
    init
    while comp:
      body
      incr
template `max=`(x, y) = x = max(x, y)
template `min=`(x, y) = x = min(x, y)

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")

proc solve(N: int, t: seq[int], l, r: seq[int]): int =
  for i in 0..<N:
    for j in (i + 1)..<N:

      var
        s_i: Slice[float] = case t[i]
          of 1:
            (float)(l[i])..(float)r[i]
          of 2:
            (float)(l[i])..((float)(r[i]) - 0.5)
          of 3:
            (float)(float(l[i]) + 0.5)..(float)(r[i])
          else:
            ((float)(l[i]) + 0.5)..((float)(r[i]) - 0.5)
        s_j: Slice[float] = case t[j]
          of 1:
            (float)(l[j])..(float)r[j]
          of 2:
            float(l[j])..((float)(r[j]) - 0.5)
          of 3:
            (float(l[j]) + 0.5)..(float)(r[j])
          else:
            ((float)(l[j]) + 0.5)..((float)(r[j]) - 0.5)
      if s_j.a in s_i or s_j.b in s_i or
      s_i.a in s_j or s_i.b in s_j:
        inc(result)



proc main(): void =
  var
    N = nextInt()
    t = newSeqWith(N, 0)
    l = newSeqWith(N, 0)
    r = newSeqWith(N, 0)
  for i in 0..<N:
    t[i] = nextInt()
    l[i] = nextInt()
    r[i] = nextInt()
  echo solve(N, t, l, r)
  return

main()
