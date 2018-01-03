defmodule SelfCheckout.A do
  import InputRetriever
  @tax 0.055
  def go do
    {subtotal, tax, total} = calculate((ask("1") + ask("2") + ask("3")))
    IO.puts """
    Subtotal: $#{subtotal}
    Tax: $#{tax}
    Total: $#{total}
    """
  end

  def ask(number) do
    price = retrieve("Enter the price of item #{number}: ")
    quantity = retrieve("Enter the quantity of item #{number}: ")
    price * quantity
  end

  def calculate(subtotal) do
    tax = @tax * subtotal
    total = tax + subtotal
    {subtotal, tax, total}
  end

end
SelfCheckout.A.go
