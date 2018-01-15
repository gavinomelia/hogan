defmodule InputRetriever do
  def retrieve(prompt) do
    number = IO.gets(prompt) |> String.trim
    case number |> Float.parse  do
      :error ->
        IO.puts "Please enter a valid amount."
        retrieve(prompt)
        { amount, _ } when amount < 0 ->
          IO.puts "No negatives allowed."
          retrieve(prompt)
          { amount, _ } -> amount
        end
      end
      def retrieve_string(prompt, list) do
        the_string = IO.gets(prompt) |> String.trim |> String.downcase
        case Enum.member?(list, the_string) do
          false ->
            IO.puts "Please enter a valid string."
            retrieve_string(prompt, list)
            true ->
              the_string
            end
          end

          def repeat_retrieve(prompt) do
            number = IO.gets(prompt) |> String.trim
            if number == "done" do
              :done
            else
              case number |> Float.parse  do
                :error ->
                  IO.puts "Please enter a valid amount."
                  retrieve(prompt)
                  { amount, _ } when amount < 0 ->
                    IO.puts "No negatives allowed."
                    retrieve(prompt)
                    { amount, _ } -> amount
                  end
                end
              end

              def retrieve_string(prompt) do
                IO.gets(prompt) |> String.trim |> String.downcase
              end
              def retrieve_string_case(prompt) do
                IO.gets(prompt) |> String.trim
              end
            end
