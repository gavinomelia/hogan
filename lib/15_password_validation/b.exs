defmodule PasswordValidation.B do
  import InputRetriever
  def go(hash_map \\ %{}) do
    account? = retrieve_string("Do you already have an account? ")
    handle_login(account?, hash_map)
  end

  def handle_login("yes", hash_map) do
    {username, password} = get_info()
    verify_the_password(password, Map.fetch(hash_map, username), hash_map)
  end
  def handle_login("no", hash_map) do
    {username, password} = get_info()
    hash_map = Map.put(hash_map, username, password |> Bcrypt.hash_pwd_salt)
    PasswordValidation.B.go(hash_map)
  end
  def handle_login(_, hash_map) do
    IO.puts("Sorry, only yes or no is accepted as an answer. Try again. \n")
    PasswordValidation.B.go(hash_map)
  end

  def get_info() do
    username = retrieve_string_case("What is your username? ") |> String.to_atom
    password = retrieve_string_case("What is your password? ")
    {username, password}
  end

  def verify_the_password(_, :error, hash_map) do
    IO.puts "Sorry, that login does not exist. Try again. \n"
    PasswordValidation.B.go(hash_map)
  end
  def verify_the_password(password, {:ok, key}, hash_map) do
    case Bcrypt.verify_pass(password, key) do
      true ->
        IO.puts "Welcome! \n"
        PasswordValidation.B.go(hash_map)
        false ->
          IO.puts "That password is incorrect. Please try again. \n"
          PasswordValidation.B.go(hash_map)
        end
      end
    end
    PasswordValidation.B.go
