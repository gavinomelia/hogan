defmodule AreaOfRoom.D do
  @feet_meter_conversion 0.09290304
  @meter_feet_conversion 3.28084
  def get(:length), do: IO.gets("What is the length of the room? ") |> String.strip |> Float.parse |> filter(:length)
  def get(:width), do: IO.gets("What is the width of the room? ") |> String.strip |> Float.parse |> filter(:width)

  def filter(:error, dimension) do
    IO.puts "That is not a valid number. Try again."
    get(dimension)
  end
  def filter(num, _), do: num

  def go do
    units = IO.gets("What is your length and width in, feet or meters? ") |> String.strip
    {length, _} = get(:length)
    {width, _} = get(:width)
    calculate(units, length, width)
  end

  def calculate("feet", length, width) do
    area_feet = (length * width)
    area_meters = (area_feet * @feet_meter_conversion) |> Float.round(2)
    output(length, width, area_meters, area_feet)
  end
  def calculate("meters", length, width) do
    area_meters = (length * width)
    area_feet = (area_meters * @meter_feet_conversion)
    output(length, width, area_meters, area_feet)
  end

  def output(length, width, area_meters, area_feet) do
    IO.puts """
    You enter dimensions of #{length} feet by #{width} feet.
    The area is:
    #{area_feet} square feet
    #{area_meters} square meters
    """
  end
end
AreaOfRoom.D.go
