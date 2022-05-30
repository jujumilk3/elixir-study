defmodule WeatherHistory do
  def test_data do
    [
    [1366225622, 26, 15, 0.125],
    [1366225622, 27, 15, 0.45],
    [1366225622, 28, 21, 0.25],
    [1366229222, 26, 19, 0.081],
    [1366229222, 27, 17, 0.468],
    [1366229222, 28, 15, 0.60],
    [1366232822, 26, 22, 0.095],
    [1366232822, 27, 21, 0.05],
    [1366232822, 28, 24, 0.03],
    [1366236422, 26, 17, 0.025]
    ]
  end
  def for_location_27([]), do: []
  def for_location_27([ [ time, 27, temp, rain ] | tail ]) do
    [ [  time, 27, temp, rain] | for_location_27(tail) ]
  end
  def for_location_27([ _ | tail ]), do: for_location_27(tail)
end

# run result
# iex
# Erlang/OTP 24 [erts-12.3.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit] [dtrace]

# Interactive Elixir (1.13.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> c "list/weather.exs"
# [WeatherHistory]
# iex(2)> import WeatherHistory
# WeatherHistory
# iex(3)> for_location(test_data)
# ** (CompileError) iex:3: undefined function for_location/1 (there is no such import)

# iex(3)> for_location_27(test_data)
# [
#   [1366225622, 27, 15, 0.45],
#   [1366229222, 27, 17, 0.468],
#   [1366232822, 27, 21, 0.05]
# ]
# iex(4)>


IO.inspect WeatherHistory.for_location_27(WeatherHistory.test_data)
# IO.inspect test
