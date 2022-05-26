tuple = {status, count, action} = {:ok, 42, "next"}
IO.inspect tuple
IO.puts status
IO.puts count
IO.puts action


IO.inspect [1, 2, 3] ++ [4, 5, 6]
IO.inspect [1, 2, 3, 4] -- [2, 4]
IO.inspect 1 in [1, 2, 3, 4]
IO.inspect "wombat" in [1, 2, 3, 4]


keyword_list = [name: "Dave", city: "Dallas", likes: "Programming"]
IO.inspect keyword_list
tuple_list = [{:name, "Dave"}, {:city, "Dallas"}, {:likes, "Programming"}]
IO.inspect tuple_list


list = [1, fred: 1, dave: 2]
summary = {1, fred: 1, dave: 2}
IO.inspect list
IO.inspect summary


states = %{"AL" => "alabama", "WI" => "Wisconsin"}
IO.inspect states

responses = %{{:error, :enoent} => :fatal, {:error, :busy} => :retry}
IO.inspect responses

colors = %{:red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff}
IO.inspect colors
# 이렇게 키가 아톰인 경우 키워드 리스트를 쓸 때와 같은 단축 문법을 맵에서도 사용할 수 있다
colors2 = %{red: 0xff0000, green: 0x00ff00, blue: 0x0000ff}
IO.inspect colors2

# key가 atom일 경우 온점으로 접근 가능
IO.puts colors2.red
# 보통은 대괄호
IO.puts states["AL"]

