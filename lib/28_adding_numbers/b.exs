defmodule AddingNumbers.B do
  import InputRetriever
  def go do
    count = retrieve("How many numbers would you like to add? ")
    IO.puts"The total is #{Enum.sum(loop(count, []))}"
  end

  def loop(0.0, list), do: list
  def loop(acc, list) do
    IO.inspect acc
    num = [retrieve("Enter a number: ")]
    loop(acc - 1, list ++ num)
  end
end
  AddingNumbers.B.go
