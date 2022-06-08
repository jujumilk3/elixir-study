defmodule Link1 do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    sleep 500
    exit(:boom)
  end

  def run do
    spawn(Link1, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"

    after 1000 ->
        IO.puts "Nothing happened as fat as I am concerned"
    end
  end
end

Link1.run
# 생성된 프로세스가 종료돼도 아무것도 받지 못함.
