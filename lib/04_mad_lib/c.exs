defmodule MadLib.B do
  def go do
    IO.puts "You #{get(:verb)} your #{get(:adjective)} #{get(:noun)} #{get(:adverb)} and #{get(:verb)} the #{get(:noun)}? That's hilarious!"
  end

  def get(:noun), do: IO.gets("Enter a noun: ") |> String.strip
  def get(:verb), do: IO.gets("Enter a verb: ") |> String.strip
  def get(:adjective), do: IO.gets("Enter an adjective: ") |> String.strip
  def get(:adverb), do: IO.gets("Enter an adverb: ") |> String.strip
end
MadLib.B.go
 
