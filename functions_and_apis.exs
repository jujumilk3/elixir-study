#### 연산 관련 ####

# 나머지연산
IO.inspect rem(5, 2) == 1
# 몫 연산
IO.inspect div(5, 2) == 2
# 제곱근
IO.inspect :math.sqrt(9) == 3


#### 문자열 관련 ####

# 문자열 반복
IO.inspect String.duplicate("a", 3) == "aaa"
# 첫번째 글자 가져오기
IO.inspect String.first("zxc") == "z"
# 첫번째 글자 확인
IO.inspect String.starts_with?("zxc", "z")
# 소문자로 만들기
IO.inspect String.downcase("ZXC") == "zxc"
# 대문자로 만들기
IO.inspect String.upcase("zxc") == "ZXC"
# 문자열 각 글자를 list로
IO.inspect String.graphemes("abc")  == ["a", "b", "c"]
# 문자열 특정 기준을 list로
IO.inspect String.split("Hello World", " ") == ["Hello", "World"]
# 문자열 list를 하나의 문자열로
IO.inspect Enum.join(["Hello", "World"], " ") == "Hello World"
# 문자열을 정수형으로
IO.inspect String.to_integer("123") == 123
# 정수형을 문자열로
IO.inspect Integer.to_string(123) == "123"
# 특정 문자열 교체
IO.inspect String.replace("abcabc", "a", "") == "bcbc"



#### 리스트 관련 ####

# 리스트 내의 모든 숫자를 합산
IO.inspect Enum.sum([ 1, 2, 3, 5.5 ]) == 11.5
# range를 리스트로 변환
IO.inspect Enum.to_list(1..3) == [ 1, 2, 3 ]
# 정수형 각 자릿수를 리스트로
IO.inspect Integer.digits(123) == [1, 2, 3]
# 리스트를 반전
IO.inspect Enum.reverse([1, 2, 3]) == [3, 2, 1]
# 다차원 리스트를 1차원 리스트로
IO.inspect List.flatten([[[1], 2], [[3]]]) == [1, 2, 3]
