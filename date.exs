d1 = Date.new(2018, 12, 25)
IO.inspect d1

date = {:ok, ~D[2018-12-25]}
IO.inspect date

d2 = ~D[2018-12-25]
IO.inspect d2

IO.inspect d1 == d2

#IO.inspect Date.day_of_week(d1)
#IO.inspect Date.add(d1, 7)
#inspect d1, structs: false
