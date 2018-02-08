defmodule EmployeeRemoval.A do
  import InputRetriever
  @crew ["John Smith", "Jackie Jackson", "Chris Jones", "Amanda Cullen", "Jeremy Goodwin"]
  def go do
    output(@crew)
    name = retrieve_string("\nEnter an employee's name to remove: ")
    employees = Enum.reject(@crew, fn(x) -> (x |> String.downcase) == name end)
    output(employees)
  end

  def output(names) do
    IO.puts "\nThere are #{Enum.count(names)} employees:"
    Enum.each(names, fn(x) -> IO.puts(x) end)
  end
end
EmployeeRemoval.A.go
