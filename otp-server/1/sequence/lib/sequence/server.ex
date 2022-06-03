defmodule Sequence.Server do
  use GenServer

  def init(initial_number) do
    { :ok, initial_number }
  end

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number + 1 }
  end

  def handle_cast({:increment_number, delta}, current_number) do
    { :noreply, current_number + delta }
  end

  def format_status(_reason, [ _pdict, state ]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end
end


# sequence % iex -S mix
# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Compiling 2 files (.ex)
# Generated sequence app
# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> {:ok, pid} = GenServer.start_link(Sequence.Server, 100)
# {:ok, #PID<0.181.0>}
# iex(2)> GenServer.call(pid, :next_number)
# 100
# iex(3)> GenServer.call(pid, :next_number)
# 101
# iex(4)> GenServer.call(pid, :next_number)
# 102
# iex(5)>
