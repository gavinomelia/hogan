defmodule CreditCardPayment.A do
  import InputRetriever
  def go do
    months = months_to_pay_off(
    retrieve("What is your balance? "),
    retrieve("What is the APR on the card (as a percent)? "),
    retrieve("What is the monthly payment you can make? ")
    )
    IO.puts "It will take you #{months} months to pay off this card."
  end

  def months_to_pay_off(balance, apr, payment) do
    rate = apr / 100 / 365
    a = (1 - (:math.pow((1 + rate), 30)))
    b = ((:math.log(1 + ((balance / payment) * a))) / (:math.log(1 + rate)))
    trunc(Float.round(-1/30 * b))
  end
end
  CreditCardPayment.A.go
