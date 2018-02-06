defmodule GuessTheNumber.C do
  import InputRetriever
  def go("y") do
    IO.puts "Let's play guess the number."
    level = retrieve("Pick a difficulty level (1, 2, or 3): ")
    num = get_num(level)
    guess = retrieve("I have a number. What is your first guess? ")
    loop(guess, num, 0, [])
  end
  def go("n"), do: IO.puts "Goodbye!"

  def get_num(1.0), do: Enum.random(1..10)
  def get_num(2.0), do: Enum.random(1..100)
  def get_num(3.0), do: Enum.random(1..1000)
  def get_num(_) do
    get_num(retrieve("That is not a valid level. Please enter 1, 2, or 3: "))
  end

  def loop(guess, num, acc, _) when guess == num do
    IO.puts "You got it in #{acc + 1} guesses! #{congrats(acc + 1)}"
    "Would you like to play again (y/n)? " |> retrieve_string |> go
  end
  def loop(guess, num, acc, past_guesses) when guess < num do
    check(guess, past_guesses)
    loop(retrieve("Too low!\nGuess again: "), num, acc + 1, past_guesses ++ [guess])
  end
  def loop(guess, num, acc, past_guesses) when guess > num do
    check(guess, past_guesses)
    loop(retrieve("Too high!\nGuess again: "), num, acc + 1, past_guesses ++ [guess])
  end

  def check(guess, past_guesses) do
    case guess in past_guesses do
      true ->
        IO.puts "You already guessed that number!"
      false ->
        false
    end
  end

  def congrats(x) when x == 1, do: "You're a mind reader!"
  def congrats(x) when x in 2..4, do: "Most impressive!"
  def congrats(x) when x in 5..6, do: "You can do better than that."
  def congrats(x) when x > 6, do: "Better luck next time."
end
GuessTheNumber.C.go("y")
