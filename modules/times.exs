defmodule Times do
  def double(n) do
    n * 2
  end
end

# iex modules/times.exs로 실행 후 Times.double(4)로 실행.
# 혹은 iex 실행 후 c "modules/times.exs" 입력하여 module을 load
# do...end는 개발자의 편의를 위한 문법이고 실행 자체는 한줄로 됨. 위 함수를 고쳐보면

defmodule Times2 do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(n) * 2
  def hex(n), do: triple(n) * 2
end

# 가 되며 심지어는

defmodule Times3, do: (def double(n), do: n * 2)

# 이렇게도 사용 가능. 근데 권장은 X. 무조건 최대한 가독성이 좋은 형태로.
