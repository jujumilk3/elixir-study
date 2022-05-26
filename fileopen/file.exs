{:ok, file} = File.open("hello.exs")
IO.puts :ok
IO.inspect file
IO.inspect {:ok, file}


{:error, file} = File.open("hello_failed.exs")
IO.puts :error
IO.inspect file
IO.inspect {:error, file}
