times_2 = fn n -> n * 2 end
IO.inspect times_2.(2)
apply = fn (fun, value) -> fun.(value) end
IO.inspect apply
IO.inspect apply.(times_2, 6)


IO.puts "\n#############################################\n"


list = [1, 3, 5, 7, 9]
IO.inspect Enum.map list, fn elem -> elem * 2 end
IO.inspect Enum.map list, fn elem -> elem * elem end
IO.inspect Enum.map list, fn elem -> elem > 6 end


IO.puts "\n#############################################\n"


defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_)     -> "I don't know you"

    end
  end
end

my_valim = Greeter.for("jose", "hi")
IO.puts my_valim.("jose")
IO.puts my_valim.("Dave")


IO.puts "\n#############################################\n"


add_one = &(&1 + 1)   # add_one = fn (n) -> n + 1 end와 같다.
IO.inspect add_one.(44)
square = &(&1 * &1)
IO.inspect square.(8)
speak = &(IO.puts(&1))
speak.("Hello")
rnd = &(Float.round(&1, &2))
IO.inspect rnd.(20.31232, 3)
IO.inspect rnd.(20.7353456, 5)


IO.puts "\n#############################################\n"


divrem = &{ div(&1, &2), rem(&1, &2)}
IO.inspect divrem.(13, 5)


IO.puts "\n#############################################\n"


s = &"bacon and #{&1}"
IO.puts(s.('custard'))
IO.puts s.('custard')

match_end = &~r/.*#{&1}$/
IO.puts "cat" =~ match_end.("t")
IO.puts "cat" =~ match_end.("!")


IO.puts "\n#############################################\n"


l = &length/1
IO.inspect l.([1, 3, 5, 6])

len = &Enum.count/1
IO.inspect len.([1, 2, 3, 4])

m = &Kernel.min/2  # Kernel.min/2 는 얼랭의 :erlang.min/2의 alias임.
IO.inspect m.(99, 88)


IO.puts "\n#############################################\n"


IO.inspect Enum.map [1, 2, 3, 4], &(&1 + 1)
IO.inspect Enum.map [1, 2, 3, 4], &(&1 + &1)
IO.inspect Enum.map [1, 2, 3, 4], &(&1 < 3)


IO.puts "\n#############################################\n"

# &형태로 바꾸기
IO.inspect Enum.map [1, 2, 3, 4], fn x -> x + 2 end
IO.inspect Enum.map [1, 2, 3, 4], &(&1 + 2)

Enum.each [1, 2, 3, 4], fn x -> IO.inspect x end
Enum.each [1, 2, 3, 4], &(IO.inspect &1)
