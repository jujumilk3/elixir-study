defmodule Countdown do
  def sleep(seconds) do
    receive do
      after seconds * 1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn ->
        {_h, _m, s} = :erlang.time
        60 - s - 1
      end,

      fn
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ -> nil end
    )
  end
end


# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> counter = Countdown.timer
# #Function<51.58486609/2 in Stream.resource/3>
# iex(2)> printer = counter |> Stream.each(&IO.puts/1)
# #Stream<[
#   enum: #Function<51.58486609/2 in Stream.resource/3>,
#   funs: [#Function<38.58486609/1 in Stream.each/2>]
# ]>
# iex(3)> speaker = printer |> Stream.each(&Countdown.say/1)
# #Stream<[
#   enum: #Function<51.58486609/2 in Stream.resource/3>,
#   funs: [#Function<38.58486609/1 in Stream.each/2>,
#    #Function<38.58486609/1 in Stream.each/2>]
# ]>
# iex(4)> speaker |> Enum.take(5)
# 52
# 51
# 50
# 49
# 48
# ["52", "51", "50", "49", "48"]
# iex(5)> speaker |> Enum.take(5)
# 10
# 9
# 8
# 7
# 6
# ["10", "9", "8", "7", "6"]
# iex(6)> sp
# spawn/1            spawn/3            spawn_link/1       spawn_link/3
# spawn_monitor/1    spawn_monitor/3    speaker
# iex(6)> speaker |> Enum.to_list
# 3
# 2
# 1
# ["3", "2", "1"]
# iex(7)>
