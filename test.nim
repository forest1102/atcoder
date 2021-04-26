template cfor(init, comp, incr, body: untyped) =
  block:
    init
    while comp:
      body
      incr

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc main(): void =
  cfor((var i = 0), i*i <= 100, inc(i)):
    echo i
  10.times:
    echo "hello"

main()
