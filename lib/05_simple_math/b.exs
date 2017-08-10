defmodule SimpleMath.B do
  def num(:one), do: IO.gets("What is the first number? ") |> String.strip |> Float.parse |> filter(:one)
  def num(:two), do: IO.gets("What is the second number? ") |> String.strip |> Float.parse |> filter(:two)

  def filter(:error, part) do
     IO.puts "That is not a valid number"
     num(part)
  end
  def filter({number, _}, part) when number <= 0 do
    IO.puts "Negative numbers are not allowed. Try again."
    num(part)
  end
  def filter({number, _}, _), do: number

  def go do
    one = num(:one)
    two = num(:two)

    added = one + two
    subtracted = one - two
    multiplied = one * two
    divided = one / two

    IO.puts """
    #{one} + #{two} = #{added}
    #{one} - #{two} = #{subtracted}
    #{one} * #{two} = #{multiplied}
    #{one} / #{two} = #{divided}
    """
  end
end
SimpleMath.B.go
