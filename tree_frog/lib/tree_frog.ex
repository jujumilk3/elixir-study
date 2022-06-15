defmodule TreeFrog do
  defmacro calc(n) when is_number(n) do
    n
  end

  defmacro calc({op, ctx, [left, right]}) do
    IO.inspect {op, ctx, [left, right]}
    new_op = case op do
      :+ -> :-
      :- -> :+
      :* -> :/
      :/ -> :*
    end

    new_left = quote do
      TreeFrog.calc(unquote(left))
    end

    new_right = quote do
      TreeFrog.calc(unquote(right))
    end

    {new_op, ctx, [new_left, new_right]}
  end
end

# iex(1)> quote do: (10 - 10) + (2 / 4)
# {:+, [context: Elixir, import: Kernel],
#  [
#    {:-, [context: Elixir, import: Kernel], '\n\n'},
#    {:/, [context: Elixir, import: Kernel], [2, 4]}
#  ]
# }
