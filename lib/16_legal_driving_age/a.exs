defmodule LegalDrivingAge.A do
  import InputRetriever
  def go do
    age = retrieve("What is your age? ")
    if age >= 16, do: output(""), else: output("not ")
  end

  def output(word) do
    IO.puts "You are #{word}old enough to legally drive."
  end
end
  LegalDrivingAge.A.go
