defmodule PizzaParty.A do
  def go do
     people = IO.gets("How many people do you have? ") |> String.strip |> String.to_integer
     pizzas = IO.gets("How many pizzas? ") |> String.strip |> String.to_integer
     slices = IO.gets("How many slices per pizza? ") |> String.strip |> String.to_integer

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
PizzaParty.A.go
