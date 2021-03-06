defmodule MyRedis do
  use Agent
  # 아래와 같은 API 를 가지는 MyRedis 를 GenServer 기반으로 구현하세요.
  # mix test 를 통과하면 구현이 완료된 것입니다.

  def start_link() do
    Agent.start(fn -> %{} end)
  end

  def get(pid, key) do
    Agent.get(pid, fn map -> map |> Map.fetch(key) end)
  end

  def set(pid, key, value) do
    Agent.update(pid, fn map -> map |> Map.put(key, value) end)
  end

  def delete(pid, key) do
    Agent.update(pid, fn map -> map |> Map.delete(key) end)
  end

end
