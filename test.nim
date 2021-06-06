import sugar, math
import atcoder/segtree

const INF = 1000_000_000

type
  Seg1 = SegTree[int, (op: (a, b: int) => min(a, b), e: () => INF)]
  Seg2 = SegTree[int, (op: (a, b: int) => max(a, b), e: () => 0)]

var
  seg1 = Seg1()
  seg2 = Seg2()

seg1.init(10)
seg2.init(10)

seg2[0] = 10
seg2[1] = 20

echo seg2.all_prod()
