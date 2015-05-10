defmodule NQueens.Visualizer do
  def visualize({:fail, size}) do
    IO.puts "No solution found for #{size}-queen problem."
  end

  def visualize({:ok, solution, size}) do
    last_index = size - 1
    for row <- 0..last_index do
      print_vertical_divider size
      IO.write "|"
      for column <- 0..last_index do
        print(solution, {row, column})
      end
      IO.write "\n"
    end
    print_vertical_divider size
  end

  def print(solution, position) do
    cond do
      position in solution -> IO.write " Q |"
      true                 -> IO.write "   |"
    end
  end

  def print_vertical_divider(size) do
    IO.puts String.duplicate("----", size) <> "-"
  end

end
