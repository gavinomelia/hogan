defmodule CurrencyConversion.B do
  import InputRetriever
  @rates %{:eur => 1.20, :ind => 0.0158, :aus => 0.784, :can => 0.799}
  def go do
    country = retrieve_string("What is the abbreviation of the currency you want to exchange for dollars? ")
    rate = @rates[country |> String.to_atom]
    number_of = retrieve("How many are you exchanging? ")
    converted = Float.round((number_of * rate), 2)
    IO.puts """
    #{number_of} euros at an exchange rate of #{rate} is #{converted} U.S dollars.
    """
  end
end
CurrencyConversion.B.go
