defmodule Link2 do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end

  def run do
    spawn_link(Link2, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"

    after 1000 ->
        IO.puts "Nothing happened as fat as I am concerned"
    end
  end
end

Link2.run
# spawn_link 명령어를 통해 link를 하면 프로세스가 비정상종료될 때 런타임이 이를 알려줌.
# 하나가 비정상종료되면 링크돼있는 것도 종료됨.

