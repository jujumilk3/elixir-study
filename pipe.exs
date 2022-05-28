test = (1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 < 40))
IO.inspect test


IO.puts "\n#############################################\n"


defmodule Outer do
  defmodule Inner do
    def inner_func do
      IO.puts "inner func"
    end
  end

  def outer_func do
    Inner.inner_func
  end
end

Outer.outer_func
Outer.Inner.inner_func


IO.puts "\n#############################################\n"


defmodule Example do
  def func1 do
    List.flatten [1, [2, 3], 4]
  end

  def func2 do
    import List, only: [flatten: 1]
    flatten [5, [6, 7], 8]
  end
end


IO.puts "\n#############################################\n"


defmodule Example do
  def compile_and_go(source) do
    alias My.Other.Module.Parser, as: Parser
    alias My.Other.Module.Runner, as: Runner
    source
    |> Parser.parse()
    |> Runner.execute()
  end
end
