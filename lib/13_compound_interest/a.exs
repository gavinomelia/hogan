defmodule CompoundInterest.A do
  import InputRetriever
  def calculate_compound_interest(principal, rate, years, compound) do
    Float.ceil(principal * :math.pow(1 + ((rate / 100) / compound), (compound * years)), 2)
  end
  def go do
    principal = retrieve("Enter the principal: ")
    rate = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ")
    compound = retrieve("Enter the number of times the interest is compounded per year: ")
    IO.puts("After #{years} years at #{rate}%, being compounded #{compound} times, the investment will be worth $#{calculate_compound_interest(principal, rate, years, compound)}")
    end
end
CompoundInterest.A.go
