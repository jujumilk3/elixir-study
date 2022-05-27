defmodule Factorial do
  def of(n), do: n * of(n-1)
  def of(0), do: 1
end

IO.puts Factorial.of(0)
IO.puts Factorial.of(1)
IO.puts Factorial.of(2)
IO.puts Factorial.of(5)
IO.puts Factorial.of(1000)

# 패턴매칭은 위에서 아래로 수행되기 때문에 오류 발생.
# n이 0이 되는 시점에서 1을 리턴해서 재귀를 끊어야 하는데 그 순서가 아래에 있으면
# of(n)이라는 패턴매칭에 걸려서 평생 도달하지 못함
