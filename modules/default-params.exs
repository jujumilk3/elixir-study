defmodule Example do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end
end

Example.func("a", "b")
Example.func("a", "b", "c")
Example.func("a", "b", "c", "d")


IO.puts "\n#############################################\n"


defmodule Params do
  def func(p1, p2 \\ 123)
  def func(p1, p2) when is_list(p1) do
    "You said #{p2} with a list"
  end
  def func(p1, p2) do
    "You passed in #{p1} and #{p2}"
  end
end

IO.puts Params.func(99)
IO.puts Params.func(99, "cat")
IO.puts Params.func([99])
IO.puts Params.func([99], "dog")


IO.puts "\n#############################################\n"


defmodule Chop do
  def guess(x, a..b) do
    number = div(a + b, 2)
    IO.puts "Is It #{number}?"
    make_guess(number, x, a..b)
  end

  def make_guess(number, x, _) when number == x do
    IO.puts "#{number}"
  end

  def make_guess(number, x, low.._) when number > x do
    guess(x, low..number)
  end

  def make_guess(number, x, _..high) when number < x do
    guess(x, number..high)
  end
end

Chop.guess(3, 1..1000)
Chop.guess(273, 1..1000)
Chop.guess(273, 273..1000)

IO.puts "\n#############################################\n"
