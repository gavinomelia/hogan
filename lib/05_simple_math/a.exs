defmodule SimpleMath.A do
  def num(:one), do: IO.gets("What is the first number? ") |> String.strip |> Float.parse
  def num(:two), do: IO.gets("What is the second number? ") |> String.strip |> Float.parse

  def go do
    {one, _} = num(:one)
    {two, _} = num(:two)
    IO.puts """
    #{one} + #{two} = #{math("+", one, two)}
    #{one} - #{two} = #{math("-", one, two)}
    #{one} * #{two} = #{math("*", one, two)}
    #{one} / #{two} = #{math("/", one, two)}
    """
  end

  def math("+", one, two), do: one + two
  def math("-", one, two), do: one - two
  def math("*", one, two), do: one * two
  def math("/", one, two), do: one / two
end
SimpleMath.A.go
