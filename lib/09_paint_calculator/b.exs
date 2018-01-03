defmodule PaintCalculator.B do
  import InputRetriever
  @gallon_sqft 350
  def go do
    retrieve_string("What type of room would you like to paint? Rectangular, round, or L-shaped? ") |> calculate
  end

  def calculate("rectangular") do
    length = retrieve("What is the length of the room? ")
    width = retrieve("What is the width of the room? ")
    area = length * width
    output(area)
  end

  def calculate("round") do
    diameter = retrieve("What is the diameter of the room? ")
    radius = diameter / 2
    area = 3.14159 * (radius * radius)
    output(area)
  end

  def calculate("l-shaped") do
    length1 = retrieve("What is the length of the first section? ")
    width1 = retrieve("What is the width of the first section? ")
    length2 = retrieve("What is the length of the second section? ")
    width2 = retrieve("What is the width of the second section? ")
    area = (length1 * width1) + (length2 * width2)
    output(area)
  end

  def output(area) do
    gallons = (area / @gallon_sqft) |> Float.ceil |> trunc
    IO.puts "You will need to purchase #{gallons} gallons of paint to cover #{area} square feet."
  end
end
PaintCalculator.B.go
