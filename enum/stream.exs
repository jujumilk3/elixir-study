[ 1, 2, 3, 4, 5 ]
|> Enum.map(&(&1*&1))
|> Enum.with_index
|> Enum.map(fn {value, index} -> value - index end)
|> IO.inspect   #=> [1,3,7,13,21]
# 이건 리스트를 4개 생성하므로 별로. 그래서 Stream이라는 걸 씀. yeild랑 비슷한 느낌인듯.
# 계산결과가 직접 필요하기 전까진 계산을 미루는 것. lazy_load


s = Stream.map [1, 3, 5, 7], &(&1 + 1)
IO.inspect(s)  # stream으로 존재
IO.inspect(Enum.to_list(s))  # 진짜 값이 됨


squares = Stream.map [1, 2, 3, 4], &(&1*&1)
IO.inspect(squares)
plus_ones = Stream.map squares, &(&1+1)
IO.inspect(plus_ones)
odds = Stream.filter plus_ones, fn x -> rem(x,2) == 1 end
IO.inspect(odds)
IO.inspect(Enum.to_list(odds))
# 위 함수를 정리하면
[1, 2, 3, 4]
|> Stream.map(&(&1*&1))
|> Stream.map(&(&1+1))
|> Stream.filter(fn x -> rem(x,2) == 1 end)
|> Enum.to_list
|> IO.inspect
# 스트림은 중간 결과를 담은 리스트를 만들지 않는다. 그저 원본 컬렉션의 각 값을 연속된 연산에
# 차례로 태울 뿐이다. 앞의 IEx세션에 출력된 스트림 값이 스트림의 동작을 이해하는 실마리가 된다.
# 조합된 스트림은 함수의 리스트로 표현되어 실제로 연산이 수행될 때 각 항목에 차례로 적용된다.
# -> sqlAlchemy같은 데서 query를 빌드하는 과정과 비슷하다고 생각된다.

# 중간 결과값을 저장하지 않는다는 점은 굉장한 장점이지만 실행시간은 컬렉션을 그때그때 만드는 것보다
# 두 배 정도 느려진다. 하지만 데이터가 다른 서버나 외부 센서(예를 들면 온도계)로부터 올 때는 괜찮은 구현이다.
# 데이터가 천천히 들어오거나 끝없이 들어올 수도 있기 때문이다. Enum으로 구현하면 데이터가 모두 들어올 때까지
# 기다려야 하지만 스트림을 이용하면 데이터가 들어올 때마다 처리할 수 있다.


IO.inspect Enum.map(1..100_000_000, &(&1+1)) |> Enum.take(5)
# 9초가량 소모됨 -> 100만개의 연산을 완료한 뒤에 가져오니까
IO.inspect Stream.map(1..100_000_000_000, &(&1+1)) |> Enum.take(5)
# 1초가량 소모됨 -> 연산에 필요한 만큼 값이 왔을 때 끊기니까. 1초도 컴파일시간이지 실제로 비교하면 차이가 엄청날듯.
# 아마 이걸 이용해 웹소켓을 구현하지 않을까..?


Stream.cycle(~w{ green white })
|> Stream.zip(1..10)
|> Enum.map(fn {class, value} -> "<tr class='#{class}'><td>#{value}</td></tr>\n" end)
|> IO.puts


Stream.repeatedly(fn -> true end)
|> Enum.take(10)
|> IO.inspect

Stream.repeatedly(&:random.uniform/0)
|> Enum.take(10)
|> IO.inspect



Stream.iterate(0, &(&1+1))
|> Enum.take(5)
|> IO.inspect

Stream.iterate(2, &(&1*&1))
|> Enum.take(5)
|> IO.inspect

Stream.iterate([], &[&1])
|> Enum.take(5)
|> IO.inspect



Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1 + f2}} end)
|> Enum.take(15)
|> IO.inspect
