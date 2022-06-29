defmodule Recursive do
  def factorial(0), do: 1
  def factorial(n), do: n * factorial(n-1)
end

defmodule TailRecursive do
  def factorial(n), do: _fact(n, 1)
  defp _fact(0, acc), do: acc
  defp _fact(n, acc), do: _fact(n-1, acc*n)
end

number = 100
IO.puts Recursive.factorial(number)
IO.puts TailRecursive.factorial(number)



defmodule A do
  def a() do
    B.b()
  end
end

defmodule B do
  def b() do
    A.a()
  end
end

A.a()
