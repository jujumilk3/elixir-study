list = Enum.to_list(1..5)
IO.inspect(list)
IO.inspect(Enum.concat([1,2,3], [4,5,6]))
IO.inspect(Enum.concat([1,2,3], 'abc'))
IO.inspect(Enum.map(list, &(&1 * 10)))
IO.inspect(Enum.map(list, &String.duplicate("*", &1)))
IO.inspect(Enum.at(10..20, 3))
IO.inspect(Enum.at(10..20, 20))
IO.inspect(Enum.at(10..20, 20, :no_one_here))
IO.inspect(Enum.filter(list, &(&1 > 2)))

require Integer

IO.inspect(Enum.filter(list, &Integer.is_even/1))
IO.inspect(Enum.reject(list, &Integer.is_even/1))

IO.inspect(Enum.take(list, 3))
IO.inspect(Enum.take_every(list, 2))
IO.inspect(Enum.take_while(list, &(&1 <3)))
IO.inspect(Enum.split(list, 3))
IO.inspect(Enum.split_while(list, &(&1 <3)))

IO.inspect(Enum.join(list))
IO.inspect(Enum.join(list, ", "))

IO.inspect(Enum.all?(list, &(&1 < 4)))
IO.inspect(Enum.any?(list, &(&1 < 4)))
IO.inspect(Enum.member?(list, 4))
IO.inspect(Enum.empty?(list))

IO.inspect(Enum.zip(list, [:a, :b, :c]))
IO.inspect(Enum.with_index([ "once", "upon", "a", "time" ]))



string_list = ["there", "was", "a", "crooked", "man"]
IO.inspect(string_list)
IO.inspect(Enum.sort(string_list))
IO.inspect(Enum.sort(string_list, &(String.length(&1) <= String.length(&2))))
IO.inspect(Enum.max(string_list))
IO.inspect(Enum.max_by(string_list, &String.length/1))

IO.inspect(Enum.reduce(1..100, &(&1+&2)))

longest_one = Enum.reduce(string_list, fn word, longest ->
  if String.length(word) > String.length(longest) do
    word
  else
    longest
  end
end)
IO.puts longest_one

longest_count = Enum.reduce(string_list, 0, fn word, longest ->
  if String.length(word) > longest,
  do: String.length(word),
  else: longest
end)
IO.puts longest_count


IO.inspect Enum.into 1..5, []
IO.inspect Enum.into 1..5, [100, 101]
