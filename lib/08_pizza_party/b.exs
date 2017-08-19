defmodule PizzaParty.B do
  def get(:people), do: IO.gets("How many people do you have? ") |> String.strip |> Float.parse |> filter(:people)
  def get(:pizzas), do: IO.gets("How many pizzas? ") |> String.strip |> Float.parse |> filter(:pizzas)
  def get(:slices), do: IO.gets("How many slices per pizza? ") |> String.strip |> Float.parse |> filter(:slices)

  def filter(:error, part) do
    IO.puts "That is not a valid number. Try again"
    get(part)
  end
  def filter({num, _}, part) when num < 1 do
    IO.puts "Negative numbers aren't allowed. Try again"
    get(part)
  end
  def filter({num, _}, _), do: num |> round

  def go do
     people = get(:people)
     pizzas = get(:pizzas)
     slices = get(:slices)
     pieces = pizzas * slices
     per_person = div(pieces, people)
     leftover = rem(pieces, people)
     output(people, pizzas, slices, per_person, leftover)
  end

  def output(people, pizzas, slices, per_person, leftover) do
    IO.puts """
    #{people} people with #{pizzas} pizzas.
    Each pizza has #{slices} slices.
    Each person gets #{per_person} pieces of pizza.
    There are #{leftover} leftover pieces.
    """
  end
end
PizzaParty.B.go
