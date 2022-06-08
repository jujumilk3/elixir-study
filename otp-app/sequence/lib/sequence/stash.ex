defmodule Sequence.Stash do
  use GenServer

  @me __MODULE__

  def start_link(initial_number) do
    GenServer.start_link(__MODULE__, initial_number, name: @me)
  end

  def get() do
    GenServer.call(@me, { :get })
  end

  def update(new_number) do
    GenServer.cast(@me, { :update, new_number })
  end


  # 서버 구현

  def init(initial_number) do
    { :ok, initial_number }
  end

  def handle_call({ :get }, _from, current_number) do
    { :reply, current_number, current_number }
  end

  def handle_cast({ :update, new_number }, _current_number) do
    { :noreply, new_number }
  end

end

# 재시작 전후로 프로세스의 상태를 유지하기 위한 별도의 프로세스.
# 수열서버가 종료할 떄 자신의 현재 값을 스태시 서버에 저장하고 재시작할 때 스태시로부터 값을 가져옴.
