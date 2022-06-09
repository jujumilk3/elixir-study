IO.puts (true == true) == true
IO.puts (true != false) == true

IO.puts (1 == 1.0) == true
IO.puts (1 != 1.0) == false

IO.puts (1 === 1) == true
IO.puts (1 !== 1) == false


IO.puts true || false  # if a == true, return true, or b
IO.puts (false || 1) == 1
IO.puts (true || 1) == true
IO.puts ("" || 1)
IO.puts (2 || 1)
IO.puts ""

IO.puts false && false  # if a == false, return false, or b
IO.puts true && 1
IO.puts true && false
IO.puts true && ""
IO.puts ""

IO.puts true or 1  # if a == true, return true, or b
IO.puts false or 1
IO.puts false or false
IO.puts ""

# 좌측엔 무조건 boolean
IO.puts false and 1  # if a == false, return false, or b
IO.puts true and 1
IO.puts true and true
IO.puts true and ""
IO.puts true and false
IO.puts false and true
IO.puts ""


IO.puts rem(10, 3)  # % 연산자 -> remain -> 나머지
IO.puts 10 / 3
IO.puts div(10, 3)  # 정수만


# 정식 명칭
# 1. || -> Boolean "or" operator.
# 2. or -> Strictly boolean "or" operator. (좌측에 boolean만 올 수 있음)
# 3. && -> Boolean "and" operator.
# 4. and -> Strictly boolean "and" operator.
# 둘 다 작동은 비슷함. 조건에 맞으면 왼쪽, 아니면 오른쪽을 반환하는 것.
# 하지만 or와 and처럼 알파벳으로 돼있는 애들은 Boolean strict type이라 왼쪽에 bool이 와야하는 것.
