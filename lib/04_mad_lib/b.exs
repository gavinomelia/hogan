defmodule MadLib.B do
  def go do
    IO.puts "You #{get("verb")} your #{get("adjective")} #{get("noun")} #{get("adverb")} and #{get("verb")} the #{get("noun")}?\nThat's hilarious!"
  end

  def get(type_of_word), do: IO.gets("Enter a #{type_of_word}: ") |> String.strip
end
MadLib.B.go
