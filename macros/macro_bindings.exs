defmodule My do
  defmacro mydef(name) do
    quote do
      def unquote(name)(), do: unquote(name)
    end
  end
end

defmodule Test do
  require My
  [ :fred, :bert ] |> Enum.each(&My.mydef(&1))
end

IO.puts Test.fred
# 매크로는 컴파일타임에 호출되는데 매크로에 인자를 전달할 Enum.each는
# 런타임에 실행되므로 매크로가 호출될 시점에는 Enum.each가 아직 실행되지 않은 상태이므로
# 전달할 수 잇는 이름이 없다. 그래서 바인딩을 사용해야 한다.



defmodule My do
  defmacro mydef(name) do
    quote bind_quoted: [name: name] do
      def unquote(name)(), do: unquote(name)
    end
  end
end

defmodule Test do
  require My
  [ :fred, :bert ] |> Enum.each(&My.mydef(&1))
end

IO.puts Test.fred
IO.puts Test.bert
IO.puts Test.unknown




defmodule My do
  defmacro mydef(name) do
    quote bind_quoted: [name: name] do
      "Hello #{name}"
    end
  end
end

defmodule Test do
  require My
  [ :damon, :gyudoza ] |> Enum.each(&My.mydef(&1))
end

IO.puts Test.damon



defmodule My do
  defmacro mydef(name) do
    quote do
      name = unquote(name)
      "Hello #{name}"
    end
  end
end

defmodule Test do
  require My
  [ :damon, :gyudoza ] |> Enum.each(&My.mydef(&1))
end

IO.puts Test.damon
