defprotocol Collection do
  @fallback_to_any true
  def is_collection?(value)
end

defimpl Collection, for: [List, Tuple, BitString, Map] do
  def is_collection?(_), do: true
end

defimpl Collection, for: Any do
  def is_collection?(_), do: false
end

Enum.each [1, 1.0, [1, 2], {1, 2}, %{}, "cat"], fn value ->
  IO.puts "#{inspect value}:   #{Collection.is_collection?(value)}"
end


# 프로토콜에서 사용 가능한 자료형
# Any, Atom, BitString, Float, Function, Integer, List, Map, PID, Port, Reference, Struct, Tuple


# define protocol
defprotocol Artist do
  def(perform(artist))
end


# define polymorphism
defimpl Artist, for: Any do
  def perform(_) do
    "Artist showed performance"
  end
end

defimpl Artist, for: Musician do
  def perform(musician) do
    "#{musician.name} played #{musician.instrument}"
  end
end

defimpl Artist, for: Dancer do
  def perform(dancer), do: "#{dancer.name} performed #{dancer.dance_style}"
end


# create structure
defmodule Painter do
  @derive Artist
  defstruct name: ""
end
defmodule(Musician, do: defstruct(name: "", instrument: ""))
defmodule(Dancer, do: defstruct(name: "", dance_style: ""))
defmodule(Physicist, do: defstruct(name: ""))


# test
# https://stackoverflow.com/questions/39576209/elixir-cannot-access-struct
defmodule Test do
  painter = %Painter{name: "Emily"}
  IO.inspect painter
  IO.inspect Artist.perform(painter)

  musician = %Musician{name: "Andre", instrument: "violin"}
  IO.inspect musician
  IO.inspect Artist.perform(musician)

  dancer = %Dancer{name: "Darcy", dance_style: "ballet"}
  IO.inspect dancer
  IO.inspect Artist.perform(dancer)
end



defmodule Protocols do
  # define protocol
  defprotocol Artist do
    def(perform(artist))
  end

  # define polymorphism
  defimpl Artist, for: Any do
    def perform(_) do
      "Artist showed performance"
    end
  end

  defimpl Artist, for: Protocols.Musician do
    def perform(musician) do
      "#{musician.name} played #{musician.instrument}"
    end
  end

  defimpl Artist, for: Protocols.Dancer do
    def perform(dancer), do: "#{dancer.name} performed #{dancer.dance_style}"
  end


  # create structure
  defmodule Painter do
    @derive Artist
    defstruct name: ""
  end
  defmodule(Musician, do: defstruct(name: "", instrument: ""))
  defmodule(Dancer, do: defstruct(name: "", dance_style: ""))
  defmodule(Physicist, do: defstruct(name: ""))

end


# test
# https://stackoverflow.com/questions/39576209/elixir-cannot-access-struct
defmodule Test do
  painter = %Protocols.Painter{name: "Emily"}
  IO.inspect painter
  IO.inspect Protocols.Artist.perform(painter)

  musician = %Protocols.Musician{name: "Andre", instrument: "violin"}
  IO.inspect musician
  IO.inspect Protocols.Artist.perform(musician)

  dancer = %Protocols.Dancer{name: "Darcy", dance_style: "ballet"}
  IO.inspect dancer
  IO.inspect Protocols.Artist.perform(dancer)
end
