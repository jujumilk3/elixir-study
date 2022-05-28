IO.inspect [1, 2, 3 | [4, 5, 6]]

defmodule Swapper do
  def swap([]), do: []
  def swap([ a, b | tail ]), do: [ b, a | swap(tail) ]
  def swap([_]), do: raise "Can't swap"
end

list = [1, 2, 3, 4 ,5, 6]
IO.inspect Swapper.swap(list)
