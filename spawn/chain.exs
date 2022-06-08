defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        IO.inspect "counter"
        IO.inspect next_pid
        IO.inspect n
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    code_to_run = fn (_, send_to) ->
      IO.inspect "create_processes"
      IO.inspect send_to
      spawn(Chain, :counter, [send_to])
    end

    last = Enum.reduce(1..n, self(), code_to_run)
    IO.puts "The first self()"
    IO.inspect self()
    IO.inspect last
    # send를 하기 전까지는 spawn으로 생성만 한 상태. send를 해야 전달됨.
    # last에는 Enum.reduce가 1..n까지의 범위를 순회하며 code_to_run을 호출한 프로세스 사슬이 구성돼있는것.
    # 실행은 돼있지 않음. 말 그대로 swawn, 생성만 한 상태.
    send(last, 0)

    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    :timer.tc(Chain, :create_processes, [n])
    |> IO.inspect
  end
end

# % elixir -r chain.exs -e "Chain.run(10)"
# {1985, "Result is 10"}
# PID<0.107.0>
# PID<0.106.0>
# PID<0.105.0>
# PID<0.104.0>
# PID<0.103.0>
# PID<0.102.0>
# PID<0.101.0>
# PID<0.100.0>
# PID<0.99.0>
# PID<0.93.0>
# % elixir -r chain.exs -e "Chain.run(10000)"
# {37992, "Result is 10000"}
# % elixir -r chain.exs -e "Chain.run(100000)"
# {365545, "Result is 100000"}
# % elixir --erl "+P 1000000" -r chain.exs -e "Chain.run(1_000_000)"
# {3780307, "Result is 1000000"}
# %
