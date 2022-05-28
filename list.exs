list = [1 | [ 2 | [ 3 | [] ] ] ]
IO.inspect list


[a, b, c] = [1, 2, 3]
IO.puts a
IO.puts b
IO.puts c


[head | tail] = [1, 2, 3]
IO.inspect head
IO.inspect tail


defmodule MyList do
  def len([]), do: 0
  # def len([ head | tail ]), do: 1 + len(tail)
  def len([ _head | tail ]), do: 1 + len(tail)

  def square([]), do: []
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def add_1([]), do: []
  def add_1([ head | tail ]), do: [ head + 1 | add_1(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  def reduce([], value, _func), do: value
  def reduce([ head | tail ], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum([], _), do: 0
  def mapsum([ head | tail ], func), do: func.(head) + mapsum(tail, func)

  def max([]), do: nil
  def max([ a ]), do: a
  def max([ a, b ]) when a >= b, do: a
  def max([ _, b ]), do: b
  def max([ head | tail ]), do: max([ head, max(tail) ])
end
IO.puts MyList.len([])
IO.puts MyList.len([11, 12, 13, 14, 15])
IO.puts MyList.len(['cat', 'dog'])

IO.inspect MyList.square([])
IO.inspect MyList.square([4, 6, 8])

IO.inspect MyList.add_1([])
IO.inspect MyList.add_1([4, 6, 8])

IO.inspect MyList.map([1, 2, 3, 4], fn (n) -> n * n end)
IO.inspect MyList.map([1, 2, 3, 4], fn (n) -> n + 1 end)
IO.inspect MyList.map([1, 2, 3, 4], fn (n) -> n > 2 end)
IO.inspect MyList.map([1, 2, 3, 4], &(&1 + 1))
IO.inspect MyList.map([1, 2, 3, 4], &(&1 > 2))
IO.inspect MyList.map([], &(&1 > 2))
IO.inspect MyList.map([], fn (_) -> false end)

IO.inspect MyList.reduce([1, 2, 3, 4, 5], 0, &(&1 + &2))
IO.inspect MyList.reduce([1, 2, 3, 4, 5], 1, &(&1 * &2))
IO.inspect MyList.reduce([1, 2, 3, 4, 5], 0, &(&1 * &2))

IO.inspect MyList.mapsum([1, 2, 3], &(&1 * &1))

IO.inspect MyList.max([3,4,6,1,30,5,100,2,5])
