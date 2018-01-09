defmodule SimpleInterest.A do
  import InputRetriever
  def go do
    principal = retrieve("Enter the principal: ")
    interest = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ")
    worth = Float.ceil(principal * (1 + ((interest / 100) * years)), 2)
    IO.puts("After #{years} years at #{interest}%, the investment will be worth $#{worth}")
  end
end
SimpleInterest.A.go
