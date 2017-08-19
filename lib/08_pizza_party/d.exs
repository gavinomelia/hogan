defmodule PizzaParty.D do
  import InputRetriever
  def go do
     people = retrieve("How many people do you have? ") |> round
     pizzas = retrieve("How many pizzas? ") |> round
     slices = retrieve("How many slices per pizza? ") |> round
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
PizzaParty.D.go
