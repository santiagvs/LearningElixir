defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    # variables are immutable on Elixir, use recursion

    IO.puts "Sum: #{sum([1, 2, 3])}"

    loop(5, 1)
  end

  def sum([]), do: 0

  def sum([h|t]), do: h + sum(t)

  def loop(0, _), do: nil
    
  def loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Num: #{max}"
      loop(max - 1, min)
    end
  end
end
