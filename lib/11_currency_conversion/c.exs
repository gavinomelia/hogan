defmodule CurrencyConversion.C do
  import InputRetriever
  def compact(number) do
    number |> Float.ceil(2) |> Float.to_string
  end
  def go do
    HTTPoison.start
    app_id = IO.gets("What is your app id for openexchangerates.org? ") |> String.trim
    currency = IO.gets("What is the abbreviation of the currency you want to exchange? ") |> String.trim |> String.upcase
    quantity = retrieve("How many #{currency} are you exchanging? ")
    exchange_rate =
      case HTTPoison.get("https://openexchangerates.org/api/latest.json?app_id=#{app_id}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        parsed = body |> Poison.decode!
        rates = parsed["rates"]
        rates[currency]
      _ ->
        IO.puts "There was an error getting the current exchange rate. Defaulting to 0.894876."
        0.894876
    end
    IO.puts """
    #{quantity |> compact} #{currency} at an exchange rate of #{exchange_rate} is
    #{(quantity * exchange_rate) |> compact} U.S dollars
    """

  end
end
CurrencyConversion.C.go
