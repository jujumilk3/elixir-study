defmodule Frequency do
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def add_word(word) do
    Agent.update(
      __MODULE__,
      fn map ->
        Map.update(map, word, 1, &(&1 + 1))
      end
    )
  end

  def count_for(word) do
    Agent.get(__MODULE__, fn map -> map[word] end)
  end

  def words do
    Agent.get(__MODULE__, fn map -> Map.keys(map) end)
  end
end

# iex
# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> c "agent_dict.exs"
# [Frequency]
# iex(2)> Frequency.start_link
# {:ok, #PID<0.114.0>}
# iex(3)> Frequency.add_word "dave"
# :ok
# iex(4)> Frequency.add_word "here"
# :ok
# iex(5)> Frequency.add_word "he"
# :ok
# iex(6)> Frequency.add_word "was"
# :ok
# iex(7)> Frequency.words
# ["dave", "he", "here", "was"]
# iex(8)> Frequency.add_word "was"
# :ok
# iex(9)> Frequency.words
# ["dave", "he", "here", "was"]
# iex(10)> Frequency.count_for("dave")
# 1
# iex(11)> Frequency.count_for("was")
# 2
