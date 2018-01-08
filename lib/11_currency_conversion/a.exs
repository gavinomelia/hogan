defmodule CurrencyConversion.A do
  import InputRetriever
  def go do
    number_of = retrieve("How many euros are you exchanging? ")
    rate = retrieve("What is the exchange rate? ")
    converted = Float.round((number_of * rate), 2)
    IO.puts """
    #{number_of} euros at an exchange rate of #{rate} is #{converted} U.S dollars.
    """
  end
end
CurrencyConversion.A.go
