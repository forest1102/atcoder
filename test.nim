proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld", addr result)

template cfor(init, comp, incr, body: untyped) =
  block:
    init
    var first_time = true
    while comp:
      body
      incr
template `max=`(x, y) = x = max(x, y)
template `min=`(x, y) = x = min(x, y)

proc in_range(a, l, r: SomeOrdinal): bool = l <= a and a <= r
proc clamp(a, l, r: SomeOrdinal): SomeOrdinal = min(max(a, l), r)

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc main(): void =
  var a = nextInt()
  echo a.clamp(0, 100)

main()
