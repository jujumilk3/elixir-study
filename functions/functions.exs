sum = fn (a, b) -> a + b end
IO.puts sum.(1, 2)
greet = fn -> IO.puts "Hello" end
greet.()


IO.puts "\n#############################################\n"


f1 = fn a, b -> a * b end
IO.puts f1.(5, 6)
f2 = fn -> 99 end
IO.puts f2.()


IO.puts "\n#############################################\n"


swap = fn {a, b} -> {b, a} end
IO.inspect swap.({6, 8})


IO.puts "\n#############################################\n"


list_concat = fn a, b -> a ++ b end
IO.inspect list_concat.([:a, :b], [:c, :d])


IO.puts "\n#############################################\n"


new_sum = fn a, b, c -> Enum.sum([a, b, c]) end
IO.puts new_sum.(1, 2, 3)


IO.puts "\n#############################################\n"


pair_tuple_to_list = fn {a, b} -> [a, b] end
IO.inspect pair_tuple_to_list.({1234, 5678})


IO.puts "\n#############################################\n"


handle_open = fn
    {:ok, file} -> "Read data: #{IO.read(file, :line)}"
    {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("./hello.exs"))
IO.puts handle_open.(File.open("none_existent"))


IO.puts "\n#############################################\n"


fizz_buzz = fn
    (0, 0, _) -> "FizzBuzz"
    (0, _, _) -> "Fizz"
    (_, 0, _) -> "Buzz"
    (_, _, a) -> a
end
IO.puts fizz_buzz.(0, 1, 2)
IO.puts fizz_buzz.(1, 0, 2)
IO.puts fizz_buzz.(0, 0, 2)
IO.puts fizz_buzz.(1, 2, 3)


IO.puts "\n#############################################\n"

fun1 = fn -> fn -> "hello" end end
IO.inspect fun1.()
IO.inspect fun1.().()

fun2 = fn -> (fn -> "hello" end) end
IO.inspect fun2.()
IO.inspect fun2.().()

