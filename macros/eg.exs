defmodule My do
  defmacro macro(code) do
    IO.inspect code
    # code
    # quote do: IO.puts "Different code"
    # quote do
    #   IO.inspect(unquote(code))
    # end

  end
end

defmodule Test do
  require My
  My.macro(IO.puts("hello"))
end


IO.inspect Code.eval_quoted(quote do: [1, 2, unquote([3, 4])])
IO.inspect Code.eval_quoted(quote do: [1, 2, unquote_splicing([3, 4])])
IO.inspect Code.eval_quoted(quote do: [?a, ?=, unquote_splicing('1234')])
