defmodule Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
        greet()
        # receive는 대기하는 것이므로 다시 이렇게 호출해줘서 대기를 시켜줘야만 
    end
  end
end

pid = spawn(Spawn2, :greet, [])

send pid, {self(), "World!"}
receive do
  {:ok, msg} ->
    IO.puts msg
end

send pid, {self(), "Kermit!"}
receive do
  {:ok, msg} ->
    IO.puts msg
  after 500 ->
    IO.puts "The greeter has gone away"
end
