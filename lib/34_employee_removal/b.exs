defmodule EmployeeRemoval.B do
  import InputRetriever
  @crew ["John Smith", "Jackie Jackson", "Chris Jones", "Amanda Cullen", "Jeremy Goodwin"]
  def go do
    output(@crew)
    name = get_name()
    employees = Enum.reject(@crew, fn(x) -> (x |> String.downcase) == name end)
    output(employees)
  end

  def output(names) do
    IO.puts "\nThere are #{Enum.count(names)} employees:"
    Enum.each(names, fn(x) -> IO.puts(x) end)
  end

  def get_name() do
    name = retrieve_string("\nEnter an employee's name to remove: ")
    if Enum.any?(@crew, fn(x) -> (x |> String.downcase) === name end) do
      IO.puts "The name was removed."
      name
    else
      IO.puts "Sorry, that name does not exist"
      name
    end
  end
end
EmployeeRemoval.B.go
