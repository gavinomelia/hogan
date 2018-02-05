defmodule GuessTheNumber.A do
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
     go(retrieve_string("Would you like to play again (y/n)? "))
   end
  def loop(guess, num, acc) when guess < num do
    loop(retrieve("Too low!\nGuess again: "), num, acc + 1)
  end
  def loop(guess, num, acc) when guess > num do
    loop(retrieve("Too high!\nGuess again: "), num, acc + 1)
  end
end
  GuessTheNumber.A.go("y")
