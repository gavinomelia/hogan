defmodule SelfCheckout.C do
  import InputRetriever
  @tax 0.055
  def go do
    IO.puts "Welcome to Self Checkout! Just type \"done\" twice when you are finished."
    subtotal = Enum.reduce(retrieve_line_items, 0, fn({price, quantity}, acc) -> (price * quantity) + acc end)
    total_tax = subtotal * @tax
    total = subtotal + total_tax
    IO.puts """
    Subtotal: $#{subtotal |> compact}
    Tax: $#{total_tax |> compact}
    Total: $#{total |> compact}
    """
  end

  def price_quantity do
    price = repeat_retrieve("Enter the price of the item: ")
    quantity = repeat_retrieve("Enter the quantity of the item: ")
    {price, quantity}
  end

  def retrieve_line_items(acc \\ []) do
    the_num = price_quantity
    if the_num == {:done, :done} do
      acc |> Enum.reverse
    else
      (retrieve_line_items([the_num | acc]))
    end
  end

  def compact(number) do
    number |> Float.round(2)
  end
end
SelfCheckout.C.go
