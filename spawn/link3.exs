defmodule Link3 do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Link3, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"

    after 1000 ->
        IO.puts "Nothing happened as fat as I am concerned"
    end
  end
end

Link3.run
# :trap_exit이라는 건 생성된 프로세스가 종료될 때 발생하는 flag(:EXIT)를 잡아서
# 그대로 진행하겠다는 의미.
