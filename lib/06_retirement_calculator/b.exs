defmodule RetirementCalculator.B do
  def get(:age), do: IO.gets("What is your current age? ") |> String.strip |> Float.parse
  def get(:retire_age), do: IO.gets("At what age would you like to retire? ") |> String.strip |> Float.parse

  def go do
    {age, _} = get(:age)
    {retire_age, _} = get(:retire_age)

    years_till_retire = retire_age - age
    {year, _, _} = :erlang.date
    retire_year = year + years_till_retire
    output(years_till_retire, year, retire_year)
  end

  def output(years_till_retire, year, retire_year) when years_till_retire < 0 do
    IO.puts """
    You could have retired #{- trunc(years_till_retire)} years ago!
    It's #{year} so you could have retired in #{trunc(retire_year)}
    """
  end
  def output(years_till_retire, year, retire_year) do
    IO.puts """
    You have #{trunc(years_till_retire)} years left until you can retire.
    It's #{year} so you can retire in #{trunc(retire_year)}
    """
  end
end
RetirementCalculator.B.go
