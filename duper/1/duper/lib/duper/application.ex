defmodule Duper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Duper.Worker.start_link(arg)
      # {Duper.Worker, arg}
      Duper.Results,
      { Duper.PathFinder, "/Users/gyu/IdeaProjects" },
      Duper.WorkerSupervisor,
      { Duper.Gatherer, 2 }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Duper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end


""" 실행결과. 차례대로 워커 1, 2, 3, 4
duper % time mix run --no-halt > dups.out
mix run --no-halt > dups.out  18.48s user 9.44s system 216% cpu 12.882 total
duper % time mix run --no-halt > dups.out
mix run --no-halt > dups.out  22.03s user 10.89s system 340% cpu 9.662 total
duper % time mix run --no-halt > dups.out
mix run --no-halt > dups.out  27.08s user 12.00s system 434% cpu 8.994 total
duper % time mix run --no-halt > dups.out
mix run --no-halt > dups.out  30.85s user 13.67s system 483% cpu 9.210 total
duper %
"""
