defmodule CompoundInterest.B do
  import InputRetriever
  def calculate_principal(total, rate, years, compound) do
    Float.ceil(total / :math.pow((1 + ((rate / 100) / compound)), (compound * years)), 2)
  end
  def go do
    total = retrieve("Enter the final amount: ")
    rate = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ")
    compound = retrieve("Enter the number of times the interest is compounded per year: ")
    IO.puts("If the total is $#{total} for a #{years} year investment and the rate is #{rate}% and it compounds #{compound} times a year, the principal was #{calculate_principal(total, rate, years, compound)}")
    end
end
CompoundInterest.B.go
