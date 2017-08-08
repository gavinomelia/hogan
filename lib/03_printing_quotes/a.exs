defmodule PrintingQuotes.A do
  def go do
    saying = IO.gets("What is the quote? ") |> String.strip
    person = IO.gets("Who said it? ") |> String.strip
    IO.puts "#{person} says, \"#{saying}\""
  end
end
PrintingQuotes.A.go
