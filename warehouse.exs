defmodule Warehouse do

  @doc """
  For the coordinates described in the input, return the id of the item in those coordinates..
  """
  def initialize_program do
    get_position([], true)
  end

  def get_position(positions, ask_input) do
    cond do
      ask_input == true ->
        grab_input(positions)
      ask_input == false ->
        determine_position(positions)
    end
  end

  def determine_position(new_input) do
    first_digit = List.first(new_input)
    second_digit = List.last(new_input)
    total = first_digit + second_digit

    location = div((total - 1) * (total - 2), 2) + first_digit
    location
  end

  defp grab_input(current_input) do
    input = IO.gets("") |> String.trim |> String.to_integer
    new_positions = current_input ++ [input]
    input_filter(new_positions, input)
  end

  defp input_filter(current_positions, input) do
    cond do
      input == 0 ->
        final_input = List.delete_at(current_positions, -1)
        get_position(final_input, false)
      true ->
        get_position(current_positions, true)
    end
  end
end