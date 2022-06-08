defmodule Sequence.Server do
  use GenServer
  alias Sequence.Impl

  def init(initial_number) do
    { :ok, initial_number }
  end

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, Impl.next(current_number) }
  end

  def handle_cast({:increment_number, delta}, current_number) do
    { :noreply, Impl.increment(current_number, delta) }
  end

  def format_status(_reason, [ _pdict, state ]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end
end


# iex(1)> Sequence.Server.start_link 123
# {:ok, #PID<0.161.0>}
# iex(2)> Sequence.Server.next_number
# 123
# iex(3)> Sequence.Server.next_number
# 124
# iex(4)> Sequence.Server.next_number
# 125
# iex(5)> Sequence.Server.increment_number 100
# :ok
# iex(6)> Sequence.Server.next_number
# 226
# iex(7)> Sequence.Server.next_number
# 227
