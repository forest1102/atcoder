template times(n: int, body: untyped) =
  for _ in 0..<n:
    body
times(100):
  echo "hello world"
