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

      # def start(_type, initial_number) do 와 아랫줄과 짝꿍
      # { Sequence.Stash, initial_number }, # get from mix.exs
      { Sequence.Stash, Application.get_env(:sequence, :initial_number) },
      { Sequence.Server, nil }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

# iex -S mix
# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> Sequence.Server.next_number
# 456
# iex(2)> Sequence.Server.next_number
# 457
# iex(3)> Sequence.Server.next_number
# 458
# iex(4)> Sequence.Server.increment_number 100
# :ok
# iex(5)> Sequence.Server.next_number
# 559
# iex(6)> Sequence.Server.next_number
# 560
# iex(7)>
