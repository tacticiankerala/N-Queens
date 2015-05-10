defmodule NQueens.Solver do

  def solve(size) do
    advance([], {0, 0}, size)
  end

  defp advance(board, _queen_position, size) when length(board) == size do
    {:ok, board, size}
  end

  # remember? we use zero based index!
  defp advance(board, {_row, column}, size) when column == size do
    backtrack(board, size)
  end

  defp advance(board, queen_position, size) do
    case place(board, queen_position) do
      {:ok, new_board} -> advance(new_board, advance_row(queen_position), size)
      {:fail, board}   -> advance(board, advance_column(queen_position), size)
    end
  end

  defp backtrack(board, size) when length(board) == 0, do: {:fail, size}

  defp backtrack(board, size) do
    [prev_queen_position | prev_board] = board
    advance(prev_board, advance_column(prev_queen_position), size)
  end

  defp place(board, queen_position) do
    if can_place?(board, queen_position) do
      {:ok, [queen_position | board]}
    else
      {:fail, board}
    end
  end

  defp can_place?([], _queen_position), do: true

  defp can_place?([{row, column} | _tail],
    {new_row, new_column}) when row == new_row or column == new_column, do: false

  defp can_place?([{row, column} | _tail],
    {new_row, new_column}) when abs(row - new_row) == abs(column - new_column), do: false

  defp can_place?([_head | tail], queen_position), do: can_place?(tail, queen_position)

  defp advance_row({row, _column}), do: {row + 1, 0}

  defp advance_column({row, column}), do: {row, column + 1}

end
