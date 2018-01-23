defmodule PasswordStrength.A do
  import InputRetriever
  def go do
    password = retrieve_string_case("What is the password? ")
    password_validator(password)
  end
    def password_validator(password) do
    cond do
      String.length(password) < 8 ->
        IO.puts "The password \"#{password}\" is a weak password. Try making it longer."
      String.match?(password, ~r/[\D]/) == false ->
        IO.puts "The password \"#{password}\" is a very weak password. Use letters, numbers, and special characters for a strong password."
      String.match?(password, ~r/[\d]/) == false ->
        IO.puts "The password \"#{password}\" is a weak password. Use letters, numbers, and special characters for a strong password."
      String.match?(password, ~r/[\W]/) == true ->
        IO.puts "The password \"#{password}\" is a very strong password."
      true ->
        IO.puts "The password \"#{password}\" is a strong password."
    end
  end
end
PasswordStrength.A.go
# String.match?(password, ~r/[\W]/)
