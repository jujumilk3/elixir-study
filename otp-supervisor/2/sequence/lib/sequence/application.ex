defmodule Sequence.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Sequence.Worker.start_link(arg)
      # {Sequence.Worker, arg}
      { Sequence.Stash, 123 },
      { Sequence.Server, nil }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end


# sequence % iex -S mix
# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Compiling 3 files (.ex)
# Generated sequence app
# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> Sequence.Server.in
# increment_number/1    init/1
# iex(1)> Sequence.Server.increment_number 3
# :ok
# iex(2)> Sequence.Server.next_number
# 126
# iex(3)> Sequence.Server.increment_number "cat"
# :ok
# iex(4)>
# 14:57:00.563 [error] GenServer Sequence.Server terminating
# ** (ArithmeticError) bad argument in arithmetic expression
#     :erlang.+(127, "cat")
#     (sequence 0.1.0) lib/sequence/server.ex:26: Sequence.Server.handle_cast/2
#     (stdlib 3.17.1) gen_server.erl:695: :gen_server.try_dispatch/4
#     (stdlib 3.17.1) gen_server.erl:771: :gen_server.handle_msg/6
#     (stdlib 3.17.1) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
# Last message: {:"$gen_cast", {:increment_number, "cat"}}
# State: [data: [{'State', "My current state is '127', and I'm happy"}]]

# nil
# iex(5)> Sequence.Server.next_number
# 123
# iex(6)> Sequence.Server.next_number
# 124
# iex(7)>
