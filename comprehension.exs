IO.inspect for x <- [ 1, 2, 3, 4, 5 ], do: x * x
IO.inspect for x <- [ 1, 2, 3, 4, 5 ], x < 4, do: x * x
IO.inspect for x <- [1, 2], y <- [5, 6], do: x * y
IO.inspect for x <- [1, 2], y <- [5, 6], do: {x, y}

min_maxes = [{1, 4}, {2, 3}, {10, 15}]
IO.inspect min_maxes
IO.inspect for {min, max} <- min_maxes, n <- min..max, do: n



IO.inspect first8 = Enum.to_list(1..8)
IO.inspect for x <- first8, y <- first8, x >= y, rem(x*y, 10) == 0, do: {x, y}


IO.inspect reports = [ dallas: :hot, minneapolis: :cold, dc: :muggy, la: :smoggy ]
IO.inspect for { city, weather } <- reports, do: {weather, city}


IO.inspect for << ch <- "hello" >>, do: ch
IO.inspect for << ch <- "hello" >>, do: <<ch>>
IO.inspect for << << b1::size(2), b2::size(3), b3::size(3) >> <- "hello" >>, do: "0#{b1}#{b2}#{b3}"



IO.inspect for x <- ~w{ cat dog }, into: %{}, do: {x, String.upcase(x)}
IO.inspect for x <- ~w{ cat dog }, into: Map.new, do: {x, String.upcase(x)}
IO.inspect for x <- ~w{ cat dog }, into: %{"ant" => "ANT"}, do: {x, String.upcase(x)}
