person = %{ name: "Dave", height: 1.88 }
%{ name: a_name } = person
IO.puts a_name
IO.inspect %{ name: _, height: _ } = person

# ${name: _, weight: _} = person # it occurs error because person doesn't have weight

people = [
  %{ name: "Grumpy",    height: 1.24 },
  %{ name: "Dave",      height: 1.88 },
  %{ name: "Dopey",     height: 1.32 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy",    height: 1.28 }
]

IO.inspect(for person = %{ height: height } <- people, height > 1.5, do: person)




IO.inspect %{ 2 => state } = %{ 1 => :ok, 2 => :error }
IO.inspect state



data = %{ name: "Dave", state: "TX", likes: "Elixir" }
IO.inspect data
for key <- [ :name, :likes ] do
  %{ ^key => value } = data
  IO.puts value
end



m = %{ a: 1, b: 2, c: 3 }
IO.inspect m
m1 = %{ m | b: "two", c: "three" }
IO.inspect m1
m2 = %{ m1 | a: "one" }
IO.inspect m2
