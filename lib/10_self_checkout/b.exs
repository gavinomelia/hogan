defmodule SelfCheckout.B do
  import InputRetriever
  @tax 0.055
  def go do
    IO.puts "Welcome to Self Checkout! Just type \"done\" when you are finished."
    {subtotal, tax, total} = ask(0, 0, 0, 0, 0)
    IO.puts """
    Subtotal: $#{subtotal}
    Tax: $#{tax}
    Total: $#{total}
    """
  end

  def get(number, total_p, total_q) do
      price = repeat_retrieve("Enter the price of item #{number}: ")
      if price == :done do
          ask(number, :done, 0, total_p, total_q)
      else
      quantity = retrieve("Enter the quantity of item #{number}: ")
      ask(number, price, quantity, total_p, total_q)
    end
  end

  def ask(_, :done, _, total_p, total_q), do: calculate(total_p * total_q)
  def ask(number, p, q, total_p, total_q) do
    total_p = total_p + p
    total_q = total_q + q
    number = number + 1
    get(number, total_p, total_q)
  end

  def calculate(subtotal) do
    tax = @tax * subtotal
    total = tax + subtotal
    {subtotal, tax, total}
  end

end
SelfCheckout.B.go
