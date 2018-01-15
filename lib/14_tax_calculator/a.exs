defmodule TaxCalculator.A do
  import InputRetriever
  def go do
    amount = Float.ceil(retrieve("What is the order amount? "), 2)
    state = retrieve_string("What is the state? ")
    if state == "wi" do
      tax = amount * 0.055
      IO.puts """
      The subtotal is $#{amount}
      The tax is $#{Float.ceil(tax, 2)}
      The total is $#{Float.ceil((amount + tax), 2)}
      """
    end

    if state !== "wi" do
      IO.puts "The total is $#{amount}"
    end
    end
end
TaxCalculator.A.go
