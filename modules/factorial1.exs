defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end

IO.puts Factorial.of(0)
IO.puts Factorial.of(1)
IO.puts Factorial.of(2)
IO.puts Factorial.of(5)
IO.puts Factorial.of(1000)


IO.puts "\n#############################################\n"


defmodule Sum do
  def of(0), do: 0
  def of(n), do: n + of(n-1)
end

IO.puts Sum.of(0)
IO.puts Sum.of(1)
IO.puts Sum.of(2)
IO.puts Sum.of(10)
IO.puts Sum.of(100)


IO.puts "\n#############################################\n"


defmodule Gcd do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x, y))
end

IO.puts Gcd.of(10, 2)
IO.puts Gcd.of(24, 3)
IO.puts Gcd.of(63460, 30)


IO.puts "\n#############################################\n"


defmodule Factorial2 do
  def of(0), do: 1
  def of(n) when is_integer(n) and n > 0, do: n * of(n - 1)
end

IO.puts Factorial2.of(-1)
IO.puts Factorial2.of(0)
IO.puts Factorial2.of(5)
IO.puts Factorial2.of(6)


IO.puts "\n#############################################\n"


defmodule Factorial3 do
  def of(0), do: 1
  def of(n) do
    if n < 0 do
      raise "factorial called on a negative number!"
    else
      n * of(n-1)
    end
  end
end

# IO.puts Factorial3.of(-1)
IO.puts Factorial3.of(0)
IO.puts Factorial3.of(5)
IO.puts Factorial3.of(6)
