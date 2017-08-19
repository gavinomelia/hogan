defmodule PaintCalculator.A do
  import InputRetriever
  @gallon_sqft 350
  def go do
    length = retrieve("What is the length of the room? ")
    width = retrieve("What is the width of the room? ")
    area = length * width
    gallons = (area / @gallon_sqft) |> Float.ceil |> trunc
    output(area, gallons)
  end

  def output(area, gallons) do
    IO.puts "You will need to purchase #{gallons} gallons of paint to cover #{area} square feet."
  end
end
PaintCalculator.A.go
