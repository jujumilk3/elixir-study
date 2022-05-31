def no_vowels(string) do
  string
  |> String.replace(~r/[aeiou]/, "*")
end

def separator(column_width) do
  map_join(column_width, "-+-", fn width ->
    List.duplicate("-", width)
  end)
end
