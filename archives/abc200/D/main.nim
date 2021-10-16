import sequtils, strutils, tables, bitops
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

import atcoder/modint
type mint = StaticModInt[200]
let YES = "Yes"
let NO = "No"

proc solve(N: int, A: seq[int]): void =
  var k = min(N, 8)
  var t: array[200, seq[int]]
  var output = proc (bit: int): string =
    var res: seq[int]
    for i in 0..<k:
      if bit.testBit(i):
        res.add(i + 1)
    return $(res.len()) & " " & res.join(" ")
  for bit in 1..<(1 shl k):
    var cur_sum: mint
    for i in 0..<k:
      if bit.testBit(i):
        cur_sum += A[i]
    t[cur_sum.val()].add(bit)
    if t[cur_sum.val()].len >= 2:
      echo YES
      echo output(t[cur_sum.val][0])
      echo output(t[cur_sum.val][1])
      return
  echo NO

proc main(): void =
  var N = 0
  N = nextInt()
  var A = newSeqWith(N, 0)
  for i in 0..<N:
    A[i] = nextInt() mod 200
  solve(N, A)
  return

main()
