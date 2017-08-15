defmodule AreaOfRoom.B do
  @meter_feet_conversion 0.09290304
  def get(:length), do: IO.gets("What is the length of the room in feet? ") |> String.strip |> Float.parse |> filter(:length)
  def get(:width), do: IO.gets("What is the width of the room in feet? ") |> String.strip |> Float.parse |> filter(:width)

  def filter(:error, dimension) do
    IO.puts "That is not a valid number. Try again."
    get(dimension)
  end
  def filter(num, _), do: num

  def go do
    {length, _} = get(:length)
    {width, _} = get(:width)
    area = (length * width) |> Float.round(2)
    area_meters = (area * @meter_feet_conversion) |> Float.round(2)
    output(length, width, area, area_meters)
  end

  def output(length, width, area, area_meters) do
    IO.puts """
    You enter dimensions of #{length} feet by #{width} feet.
    The area is:
    #{area} square feet
    #{area_meters} square meters
    """
  end
end
AreaOfRoom.B.go
