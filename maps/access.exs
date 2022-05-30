cast = [
  %{
    character: "Buttercup",
    actor: %{
      first: "Robin",
      last:  "Wright"
    },
    role: "princess"
  },
  %{
    character: "Westley",
    actor: %{
      first: "Cary",
      last:  "Elwes"
    },
    role: "farm boy"
  }
]

IO.inspect get_in(cast, [Access.all(), :character])
#=> ["Buttercup", "Westley"]

IO.inspect get_in(cast, [Access.at(1), :role])
#=> "farm boy"

IO.inspect get_and_update_in(cast, [Access.all(), :actor, :last],
                             fn (val) -> {val, String.upcase(val)} end)
#=> {["Wright", "Ewes"],
#    [%{actor: %{first: "Robin", last: "WRIGHT"}, character: "Buttercup",
#       role: "princess"},
#     %{actor: %{first: "Cary", last: "EWES"}, character: "Westley",
#       role: "farm boy"}]}


cast = [
  %{
    character: "Buttercup",
    actor:    {"Robin", "Wright"},
    role:      "princess"
  },
  %{
    character: "Westley",
    actor:    {"Carey", "Elwes"},
    role:      "farm boy"
  }
]

IO.inspect get_in(cast, [Access.all(), :actor, Access.elem(1)])
#=> ["Wright", "Elwes"]

IO.inspect get_and_update_in(cast, [Access.all(), :actor, Access.elem(1)],
                             fn (val) -> {val, String.reverse(val)} end)
#=> {["Wright", "Elwes"],
#    [%{actor: {"Robin", "thgirW"}, character: "Buttercup", role: "princess"},
#     %{actor: {"Carey", "sewlE"}, character: "Westley", role: "farm boy"}]}


cast = %{
  buttercup: %{
    actor:    {"Robin", "Wright"},
    role:      "princess"
  },
  westley: %{
    actor:    {"Carey", "Elwes"},
    role:      "farm boy"
  }
}

IO.inspect get_in(cast, [Access.key(:westley), :actor, Access.elem(1)])
#=> "Elwes"

IO.inspect get_and_update_in(cast, [Access.key(:buttercup), :role],
                             fn (val) -> {val, "Queen"} end)
#=> {"princess",
#    %{buttercup: %{actor: {"Robin", "Wright"}, role: "Queen"},
#      westley: %{actor: {"Carey", "Elwes"}, role: "farm boy"}}}

IO.inspect Access.pop(%{name: "Elixir", creator: "Valim"}, :name)
IO.inspect Access.pop([name: "Elixir", creator: "Valim"], :name)
IO.inspect Access.pop([name: "Elixir", creator: "Valim"], :year)
