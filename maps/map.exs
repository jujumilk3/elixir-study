map = %{ name: "Dave", likes: "Programming", where: "Dallas" }
IO.inspect map
IO.inspect Map.keys map
IO.inspect Map.values map
IO.inspect map[:name]
IO.inspect map.name

map1 = Map.drop map, [:where, :likes]
IO.inspect map1
map2 = Map.put map, :also_likes, "Ruby"
IO.inspect map2
IO.inspect Map.keys map2
IO.inspect Map.has_key?(map1, :where)
{value, updated_map} = Map.pop map2, :also_likes
IO.inspect {value, updated_map}
IO.inspect Map.equal? map, updated_map
