defmodule SayingHello.A do
  def go do
    name = IO.gets("What is your name? ") |> String.strip
    IO.puts "Hello, #{name}, nice to meet you!"
  end
end
SayingHello.A.go
