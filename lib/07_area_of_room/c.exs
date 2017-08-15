defmodule AreaOfRoom.C do
  def get(:length), do: IO.gets("What is the length of the room? ") |> String.strip |> Float.parse |> filter(:length)
  def get(:width), do: IO.gets("What is the width of the room? ") |> String.strip |> Float.parse |> filter(:width)

  def filter(:error, dimension) do
    IO.puts "That is not a valid number. Try again."
    get(dimension)
  end
  def filter(num, _), do: num

  def go do
    unit = IO.gets("Would you like to use feet or meters? ") |> String.strip |> String.downcase
    {length, _} = get(:length)
    {width, _} = get(:width)
    area = (length * width) |> Float.round(2)
    output(length, width, area, unit)
  end

  def output(length, width, area, "feet") do
    IO.puts """
    You enter dimensions of #{length} feet by #{width} feet.
    The area is:
    #{area} square feet
    """
  end
  def output(length, width, area, "meters") do
    IO.puts """
    You enter dimensions of #{length} meters by #{width} meters.
    The area is:
    #{area} square meters
    """
  end
end
AreaOfRoom.C.go
