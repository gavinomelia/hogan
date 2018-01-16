defmodule PasswordValidation.B do
  import InputRetriever
  def go do
    pass_map = %{Bobby: "bob", billy: "password"}
    username = retrieve_string_case("What is your username? ") |> String.to_atom
    password = retrieve_string_case("What is your password? ")
    case Map.fetch(pass_map, username) do
      {:ok, pass} when pass == password ->
        IO.puts "Welcome!"
      :error ->
        IO.puts "That username doesn't match. Please try again."
        PasswordValidation.B.go
      _ ->
        IO.puts "That password is incorrect. Please try again."
    end
  end
end
PasswordValidation.B.go
