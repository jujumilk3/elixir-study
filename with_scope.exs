content = "Now is the time"

lp = with {:ok, file} = File.open("/etc/passwd"),
          content = IO.read(file, :all),
          :ok = File.close(file),
#          [_, uid, gid ] = Regex.run(~r/^_lp:.*?:(\d+):(\d+)/m, content)
          [_, uid, gid ] <- Regex.run(~r/^_lp:.*?:(\d+):(\d+)/m, content)
     do
          "Group: #{gid}, User: #{uid}"
     end

IO.puts lp
IO.puts content


with [a | _] <- [1, 2, 3], do: IO.puts a
with [a | _] <- nil, do: IO.puts a, IO.inspect a
# with과 <-을 쓰면 매칭되지 않았던 값?을 리턴한다고 함. it returns nil

