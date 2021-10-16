import sequtils,strutils,sugar, algorithm, tables
proc scanf(formatstr: cstring){.header: "<stdio.h>", varargs.}
proc getchar(): char {.header: "<stdio.h>", varargs.}
proc nextInt(): int = scanf("%lld",addr result)

proc solve(A:int, B:int):string = ""

proc main():void =
  var A = nextInt()
  var B = nextInt()
  echo solve(A, B)
  return

main()
