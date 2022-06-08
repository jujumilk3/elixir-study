defmodule Sequence.Server do
  use GenServer

  # 외부 API
  # __MODULE__ means itself
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def next_number do
    GenServer.call(__MODULE__, :next_number)
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end


  # 젠서버
  def init(_) do
    { :ok, Sequence.Stash.get() }
  end

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number + 1 }
  end

  def handle_cast({:increment_number, delta}, current_number) do
    { :noreply, current_number + delta }
  end

  def terminate(_reason, current_number) do
    Sequence.Stash.update(current_number)
  end

end



# iex -S mix
# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Compiling 1 file (.ex)
# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> Sequence.Server.next_number
# 123
# iex(2)> Sequence.Server.next_number
# 124
# iex(3)> Sequence.Server.next_number
# 125
# iex(4)> Sequence.Server.increment_number 100
# :ok
# iex(5)> Sequence.Server.next_number
# 226
# iex(6)> Sequence.Server.next_number
# 227
# iex(7)> Sequence.Server.increment_number "cat"
# :ok
# iex(8)>
# 15:24:35.559 [error] GenServer Sequence.Server terminating
# ** (ArithmeticError) bad argument in arithmetic expression
#     :erlang.+(228, "cat")
#     (sequence 0.1.0) lib/sequence/server.ex:29: Sequence.Server.handle_cast/2
#     (stdlib 3.17.1) gen_server.erl:695: :gen_server.try_dispatch/4
#     (stdlib 3.17.1) gen_server.erl:771: :gen_server.handle_msg/6
#     (stdlib 3.17.1) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
# Last message: {:"$gen_cast", {:increment_number, "cat"}}
# State: 228

# nil
# iex(9)>
# nil
# iex(10)> Sequence.Server.next_number
# 228
# iex(11)> Sequence.Server.next_number
# 229
# iex(12)>
