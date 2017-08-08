defmodule CountingChars.B do
  def go do
    filter(IO.gets("What is the input string? ") |> String.strip)
  end

  def filter(""), do: IO.puts "You must enter a word."
  def filter(input) when is_number(input), do: IO.puts "You can't enter a number."
  def filter(input) do
    IO.puts "#{input} has #{String.length(input)} characters"
  end
end
CountingChars.B.go
