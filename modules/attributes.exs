defmodule Example do
  @author "Dave Thomas"
  def get_author do
    @author
  end
end


IO.puts "Example was written by #{Example.get_author}"


defmodule Example1 do
  @attr "one"
  def first, do: @attr
  @attr "two"
  def second, do: @attr
end


IO.puts "#{Example1.second} #{Example1.first}"

