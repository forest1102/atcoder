import sequtils,strutils,sugar
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)
proc nextFloat(): float = scanf("%lf",addr result)
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

import atcoder/extra/other/warlus_operator

template times(n: int, body: untyped) =
  for _ in 0..<n:
    body

proc `$` [T](x: seq[T]): string = x.mapIt($it).join(" ")
proc `ceilDiv`[T: SomeInteger](x, y: T): T = x div y + ord(x mod y != 0)

{% if mod %}
import atcoder/modint
type mint = StaticModInt[{{ mod }}]
{% endif %}
{% if yes_str %}
let YES = "{{ yes_str }}"
{% endif %}
{% if no_str %}
let NO = "{{ no_str }}"
{% endif %}

{% if prediction_success %}
proc solve({{ formal_arguments }}):string =
  discard
{% endif %}

proc main():void =
{% if prediction_success %}
  {{input_part}}
  echo solve({{ actual_arguments }})
{% else %}
# Failed to predict input format
{% endif %}
  return

main()