import sequtils, strutils, sugar, deques
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

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")


proc solve(N: int, K: int, A: seq[int]): int =
  var dp = newSeqWith(N, (a: -1, k: 0))
  var cur = 0
  var cnt = 0
  var q = initDeque[int]()
  while true:
    dp[cur] = (a: cnt, k: 0)
    inc(cnt)
    q.addLast(cur)
    if dp[A[cur]].a == -1:
      cur = A[cur]
    else:
      let k = dp[cur].a - dp[A[cur]].a + 1
      while q.len > 0:
        let c = q.popLast
        dp[c].k = k
        if c == A[cur]:
          break
      break
  cur = 0
  while true:
    var num = dp[cur]
    if num.a != -1:
      if num.k == 0:
        if num.a == K:
          return cur + 1
      else:
        if (K - num.a) mod num.k == 0:
          return cur + 1

    cur = A[cur]







proc main(): void =
  var N = 0
  N = nextInt()
  var K = 0
  K = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt() - 1
  echo solve(N, K, A)
  return

main()
