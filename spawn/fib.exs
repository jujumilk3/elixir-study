defmodule FibSolver do
  def fib(scheduler) do
    send scheduler, { :ready, self() }
    receive do
      { :fib, n, client } ->
        send client, { :answer, n, fib_calc(n), self() }
        fib(scheduler)
      { :shutdown } ->
        exit(:normal)
    end
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)
end


defmodule Scheduler do
  def run(num_processed, module, func, to_calculate) do
    # IO.inspect to_calculate
    (1..num_processed)
    |> Enum.map(fn (_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  defp schedule_processes(processes, queue, results) do
    # 위에서 불러오는 schedule_processes에는 param이 2개인데 3개가 불러진다.
    # 왜냐, 첫번째건 위에서 map으로 변경한 리스트의 요소가 들어오기 때문.
    IO.inspect processes
    # IO.inspect queue
    # IO.inspect results
    # IO.inspect ""
    receive do
      { :ready, pid } when queue != [] ->
        [ next | tail ] = queue
        send pid, { :fib, next, self() }
        schedule_processes(processes, tail, results)

      { :ready, pid } ->
        send pid, { :shutdown }
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results)
        else
          Enum.sort(results, fn {n1,_}, {n2,_} -> n1 <= n2 end)
        end

      { :answer, number, result, _pid } ->
        schedule_processes(processes, queue, [ { number, result } | results ])
    end
  end
end


to_process = List.duplicate(37, 20)
# IO.inspect to_process
# -> Byte배열로 인식하기 때문에 출력하려고 하면 ASCII 37번에 해당하는 %들이 출력되는 것.
to_process
|> Enum.to_list
|> IO.inspect(charlists: :as_lists)


Enum.each 1..10, fn num_processes ->
  {time, result} = :timer.tc(
    Scheduler, :run,
    [num_processes, FibSolver, :fib, to_process]
  )

  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n # 시간(s)"
  end
    :io.format "~2B  ~.2f~n", [num_processes, time/1000000.0]
end
