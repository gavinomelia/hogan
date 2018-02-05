defmodule AddingNumbers.A do
  import InputRetriever
  def go do
    IO.puts"The total is #{Enum.sum(loop(0, []))}"
  end

  def loop(5, list), do: list
  def loop(acc, list) do
    num = [retrieve("Enter a number: ")]
    loop(acc + 1, list ++ num)
  end
end
  AddingNumbers.A.go
