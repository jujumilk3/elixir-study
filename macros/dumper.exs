defmodule My do
  defmacro macro(param) do
    IO.inspect param
  end
end

defmodule Test do
  require My

  # 이 값들은 내부 표현과 같다.
  My.macro :atom
  My.macro 1
  My.macro 1.0
  My.macro [1, 2, 3]
  My.macro "binaries"
  My.macro {1, 2}
  My.macro do: 1
  IO.inspect quote do: [do: 1]

  # 이 값은 3-튜플로 표현된다
  My.macro {1, 2, 3, 4, 5}
  IO.inspect quote do: {1, 2, 3, 4, 5}
  # {:{}, [line: 21], [1, 2, 3, 4, 5]}

  My.macro do: (a = 1; a + a)
  # [
  #   do: {:__block__, [line: 23],
  #    [
  #      {:=, [line: 23], [{:a, [line: 23], nil}, 1]},
  #      {:+, [line: 23], [{:a, [line: 23], nil}, {:a, [line: 23], nil}]}
  #    ]}
  # ]

  My.macro do
    1 + 2
  else
    3 + 4
  end
  # [do: {:+, [line: 35], [1, 2]}, else: {:+, [line: 37], [3, 4]}]

end

# 실행해보면 quote do로 쓰는 애들은 맨 밑에 출력되는 걸 확인해볼 수 있다.
