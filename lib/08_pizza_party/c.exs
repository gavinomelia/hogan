defmodule PizzaParty.C do
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

  defp plural(1), do: ""
  defp plural(_), do: "s"
  defp is_are(1), do: "is"
  defp is_are(_), do: "are"

  def output(people, pizzas, slices, per_person, leftover) do
    IO.puts """
    #{people} people with #{pizzas} pizza#{plural(pizzas)}.
    Each pizza has #{slices} slice#{plural(slices)}.
    Each person gets #{per_person} piece#{plural(per_person)} of pizza.
    There #{is_are(leftover)} #{leftover} leftover piece#{plural(leftover)}.
    """
  end
end
PizzaParty.C.go
