defmodule Parallel do
  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn -> (send me, { self(), fun.(elem) }) end
       end)
    |> Enum.map(fn (pid) ->
         receive do {^pid, result} -> result end
       end)
  end
end
# ^pid로 강제하지 않으면 순서가 무작위로 섞임.

IO.inspect Parallel.pmap(1..10, &(&1 * &1))
