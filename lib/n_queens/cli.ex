defmodule NQueens.CLI do
  import NQueens.Solver, only: [solve: 1]
  import NQueens.Visualizer, only: [visualize: 1]

  def main(argv) do
    argv
    |> parse_args
    |> process
    |> visualize
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv,
      switches: [help: :boolean],
      aliases: [h: :help])
    case parse do
      {[help: true], _, _} -> :help
      {_, [size], _}       -> {:solve, size}
      {_, _, _}            -> :help
    end
  end

  def process(:help) do
    IO.puts """
    Usage: n_queens <size>
    """
    System.halt(0)
  end

  def process({:solve, size}) when is_integer(size), do: solve(size)

  def process({:solve, size}), do: solve(String.to_integer(size))
end
