defmodule Warehouse do

  @doc """
  For the coordinates described in the input, return the id of the item in those coordinates..
  """
  def initialize_program do
    get_position("", true, [])
  end

  def get_position(positions, ask_input, user_input) do
    cond do
      ask_input == true ->
        new_positions = IO.gets("Whats the X,Y positions? ") |> String.trim |> String.replace(",", "")

        # Filter to check for 0
        input_filter(positions, new_positions)
      ask_input == false ->
        new_positions = user_input
        IO.puts(["#{positions} #{new_positions}"])
        get_position(["#{positions} #{new_positions}"], true, [])
    end

  end

  def determine_position(positions) do
    IO.puts "Input Complete"
    IO.puts "************************"
    IO.puts(["#{positions}"])

    exit(:shutdown)
    # position_list = List.flatten(Regex.scan(~r/../, positions))
    # IO.puts(position_list)
    # Split string every 2 numbers, calculate and spit out the solutions
  end

  defp input_filter(current_positions, input) do
    cond do
      String.contains?(input, "0") ->
        determine_position(current_positions)
      true ->
        get_position(current_positions, false, input)
    end
  end
end