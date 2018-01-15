defmodule PasswordValidation.A do
  import InputRetriever
  def go do
    password = retrieve_string_case("What is the password? ")
    if password == "bob" do
      IO.puts "Welcome!"
    else
      IO.puts "I don't know you. Try again."
      PasswordValidation.A.go
    end
  end
end
  PasswordValidation.A.go
