IO.inspect [1, 2, 3 | [4, 5, 6]]

defmodule Swapper do
  def swap([]), do: []
  def swap([ a, b | tail ]), do: [ b, a | swap(tail) ]
  def swap([_]), do: raise "Can't swap"
end

list = [1, 2, 3, 4 ,5, 6]
IO.inspect Swapper.swap(list)



to_process = List.duplicate(37, 20)
IO.inspect to_process
to_process
|> IO.inspect(charlists: :as_lists)
IO.inspect List.duplicate("hello", 3)
IO.inspect List.duplicate(10, 10)


defmodule Check do
  def array(x, default \\ "hi"), do: IO.inspect {x, default}
end


Enum.to_list(1..10)
|> Check.array


Enum.to_list(1..10)
|> Check.array("This is injected")
