greeter = fn name -> (fn -> "Hello #{name}" end) end
dave_greeter = greeter.("Dave")
IO.inspect dave_greeter
IO.inspect dave_greeter.()


IO.puts "\n#############################################\n"


add_n = fn n -> (fn other -> n + other end) end
add_two = add_n.(2)
IO.inspect add_two
add_five = add_n.(5)
IO.inspect add_five
IO.inspect add_two.(3)
IO.inspect add_five.(7)


IO.puts "\n#############################################\n"


prefix = fn word -> (fn already -> word <> " " <> already end) end
mrs = prefix.("Mrs")
IO.inspect mrs.("Smith")
IO.inspect prefix.("Elixir").("Rocks")
