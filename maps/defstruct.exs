defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end


# s1 = %Subscriber{}
# IO.inspect s1
# s2 = %Subscriber{name: "Dave"}
# IO.inspect(s2)
# s3 = %Subscriber{name: "Mary", paid: true}
# IO.inspect(s3)

# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> s1 = %Subscriber{}
# %Subscriber{name: "", over_18: true, paid: false}
# iex(2)> s2 = %Subscriber{ name: "Dave" }
# %Subscriber{name: "Dave", over_18: true, paid: false}
# iex(3)> s3 = %S
# Stream        Subscriber
# iex(3)> s3 = %Subscriber{ name: "Mary", over_18: true, paid: true}
# %Subscriber{name: "Mary", over_18: true, paid: true}
# iex(4)> s3.name
# "Mary"
# iex(5)> %Subscriber{name: a_name} = s3
# %Subscriber{name: "Mary", over_18: true, paid: true}
# iex(6)> a_name
# "Mary"
# iex(7)> s4 = %Subscriber{ s3 | name: "marie" }
# %Subscriber{name: "marie", over_18: true, paid: true}
# iex(8)>



defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end


# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> a1 = %Attendee{name: "Dave", over_18: true}
# %Attendee{name: "Dave", over_18: true, paid: false}
# iex(2)> Attendee.may_attend_after_party(a1)
# false
# iex(3)> a2 = %Attendee{a1 | paid: true}
# %Attendee{name: "Dave", over_18: true, paid: true}
# iex(4)> Attendee.may_attend_after_party(a2)
# true
# iex(5)> Attendee.print_vip_badge(a2)
# Very cheap badge for Dave
# :ok
# iex(6)> a3 = %Attendee{}
# %Attendee{name: "", over_18: true, paid: false}
# iex(7)> Attendee.print_vip_badge(a3)
# ** (RuntimeError) missing name for badge
#     maps/defstruct.exs:47: Attendee.print_vip_badge/1
# iex(7)>


defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

defmodule User do
  report = %BugReport{owner: %Customer{name: "Dave", company: "Pragmatic"},
                      details: "broken"}

  IO.inspect report

  report = %BugReport{ report | owner: %Customer{ report.owner | company: "PragProg" }}

  IO.inspect report

  IO.inspect put_in(report.owner.company, "Changed")
  # IO.inspect put_in(report[:owner][:company], "Changed")

  IO.inspect update_in(report.owner.name, &("Mr. " <> &1))
  # IO.inspect update_in(report[:owner][:name], &("Mr. " <> &1))
end





nested = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last:  "Wright"
    },
    role: "princess"
  },
  westley: %{
    actor: %{
      first: "Cary",
      last:  "Ewles"     # typo!
    },
    role: "farm boy"
  }
}

IO.inspect get_in(nested, [:buttercup])
# => %{actor: %{first: "Robin", last: "Wright"}, role: "princess"}

IO.inspect get_in(nested, [:buttercup, :actor])
# => %{first: "Robin", last: "Wright"}

IO.inspect get_in(nested, [:buttercup, :actor, :first])
# => "Robin"

IO.inspect put_in(nested, [:westley, :actor, :last], "Elwes")
# => %{buttercup: %{actor: %{first: "Robin", last: "Wright"}, role: "princess"},
# =>     westley: %{actor: %{first: "Cary", last: "Elwes"}, role: "farm boy"}}




authors = [
  %{ name: "José",  language: "Elixir" },
  %{ name: "Matz",  language: "Ruby" },
  %{ name: "Larry", language: "Perl" }
]

languages_with_an_r = fn (:get, collection, next_fn) ->
   for row <- collection do
     if String.contains?(row.language, "r") do
       next_fn.(row)
     end
   end
end

IO.inspect get_in(authors, [languages_with_an_r, :name])
#=> [ "José", nil, "Larry" ]
