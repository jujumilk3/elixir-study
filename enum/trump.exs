deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit, rank]
IO.inspect deck
IO.inspect(deck |> Enum.shuffle |> Enum.take(13))
IO.inspect(deck |> Enum.shuffle |> Enum.chunk_every(13))
