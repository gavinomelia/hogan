defmodule SimpleInterest.B do
  import InputRetriever
  def calculate_simple_interest(principal, rate, years) do
    Float.ceil(principal * (1 + ((rate / 100) * years)), 2)
  end
  def go do
    principal = retrieve("Enter the principal: ")
    rate = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ")
    IO.puts("After #{years} years at #{rate}%, the investment will be worth $#{calculate_simple_interest(principal, rate, years)}")
    end
  end
  SimpleInterest.B.go
