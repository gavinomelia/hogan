defmodule SayingHello.B do
  def go do
    IO.puts "Hello, #{IO.gets("What is your name? ") |> String.strip}, nice to meet you!"
  end
end
SayingHello.B.go
