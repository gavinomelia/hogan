defmodule GuessTheNumber.B do
  import InputRetriever
  def go("y") do
    IO.puts "Let's play guess the number."
    level = retrieve("Pick a difficulty level (1, 2, or 3): ")
    num = get_num(level)
    guess = retrieve("I have a number. What is your first guess? ")
    loop(guess, num, 0)
  end
  def go("n"), do: IO.puts "Goodbye!"

  def get_num(1.0), do: Enum.random(1..10)
  def get_num(2.0), do: Enum.random(1..100)
  def get_num(3.0), do: Enum.random(1..1000)
  def get_num(_) do
    get_num(retrieve("That is not a valid level. Please enter 1, 2, or 3: "))
  end

  def loop(guess, num, acc) when guess == num do
     IO.puts "You got it in #{acc + 1} guesses!"
     IO.puts congrats(acc + 1)
     go(retrieve_string("Would you like to play again (y/n)? "))
   end
  def loop(guess, num, acc) when guess < num do
    loop(retrieve("Too low!\nGuess again: "), num, acc + 1)
  end
  def loop(guess, num, acc) when guess > num do
    loop(retrieve("Too high!\nGuess again: "), num, acc + 1)
  end

  def congrats(guesses) do
    case guesses do
      1 -> "You're a mind reader!"
      x when x in 2..4 -> "Most impressive!"
      x when x in 5..6 -> "You can do better than that."
      x when x > 6 -> "Better luck next time."
    end
  end
end
  GuessTheNumber.B.go("y")
