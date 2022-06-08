defmodule Monitor1 do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end

  def run do
    res = spawn_monitor(Monitor1, :sad_function, [])
    IO.puts inspect res
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"

    after 1000 ->
        IO.puts "Nothing happened as fat as I am concerned"
    end
  end
end

Monitor1.run
# spawn_link: 한 프로세스가 실패했을 때 다른 프로세스도 종료돼야 한다면
# spawn_monitor: 프로세스가 종료될 때 알림을 받으려면
