defmodule MyRedis do
  use GenServer
  # 아래와 같은 API 를 가지는 MyRedis 를 GenServer 기반으로 구현하세요.
  # mix test 를 통과하면 구현이 완료된 것입니다.
  @me __MODULE__

  def start_link() do
    GenServer.start_link(@me, nil)
    # 여기에 name: __MODULE__을 하면 하나만 생성되므로
    # 유일한 프로세스가 필요한 경우에만 생성한다.
  end

  def init(nil) do
    { :ok, %{} }
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def set(pid, key, value) do
    GenServer.cast(pid, {:set, key, value})
  end

  def delete(pid, key) do
    GenServer.cast(pid, {:delete, key})
  end


  def handle_call({:get, key}, _from, %{} = status) do
    {:reply, status |> Map.fetch(key), status}
    # Map.get은 없으면 nil을 반환해서 key 값이 nil일 때는 구분이 안되므로
    # fetch로 진행.
  end

  def handle_cast({:set, key, value}, %{} = status) do
    {:noreply, status |> Map.put(key, value)}
  end

  def handle_cast({:delete, key}, %{} = status) do
    {:noreply, status |> Map.delete(key)}
  end

end

# 1. call과 cast의 구분이 필요
# 2. get만 call이면 됨.
