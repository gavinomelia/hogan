defmodule CountingChars.A do
  def go do
    input = IO.gets("What is the input string? ") |> String.strip
    IO.puts "#{input} has #{String.length(input)} characters"
  end
end
CountingChars.A.go
