defmodule AreaOfRoom.A do
  @meter_feet_conversion 0.09290304
  def go do
    {length, _} = IO.gets("What is the length of the room in feet? ") |> String.strip |> Float.parse
    {width, _} = IO.gets("What is the width of the room in feet? ") |> String.strip |> Float.parse
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
AreaOfRoom.A.go
