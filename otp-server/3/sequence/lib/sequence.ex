defmodule Sequence do
  @server Sequence.Server

  def start_link(current_number) do
    GenServer.start_link(@server, current_number, name: @server)
  end

  def next_number do
    GenServer.call(@server, :next_number)
  end

  def increment_number(delta) do
    GenServer.cast(@server, {:increment_number, delta})
  end
end


# iex -S mix
# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> Sequence.start_link(123)
# {:ok, #PID<0.150.0>}
# iex(2)> Sequence.next_number
# 123
# iex(3)> Sequence.next_number
# 124
# iex(4)> Sequence.next_number
# 125
# iex(5)> Sequence.increment_number 100
# :ok
# iex(6)> Sequence.next_number
# 226
# iex(7)> Sequence.next_number
# 227
# iex(8)>
