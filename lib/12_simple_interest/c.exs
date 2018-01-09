defmodule SimpleInterest.C do
  import InputRetriever
  def calculate_simple_interest(principal, rate, years) do
    Float.ceil(principal * (1 + ((rate / 100) * years)), 2)
  end
  def go do
    principal = retrieve("Enter the principal: ")
    rate = retrieve("Enter the rate of interest: ")
    years = retrieve("Enter the number of years: ")
    amount_per_year(principal, rate, years)
    ("After #{years} years at #{rate}%, the investment will be worth $#{calculate_simple_interest(principal, rate, years)}")
    |> IO.puts
  end
  def amount_per_year(principal, rate, years) do
  year_range = 1..round(years)
  year_amounts = Enum.map(year_range, fn(year) -> {year, calculate_simple_interest(principal, rate, year)} end)
  Enum.each(year_amounts, fn({year, total}) -> IO.puts("Year #{year}: $#{total}") end)
  end
end
SimpleInterest.C.go
