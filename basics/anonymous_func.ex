defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    get_sum = fn(x, y) -> x + y end
    IO.puts "5 + 5 = #{get_sum.(5, 5)}"

    get_less = &(&1 - &2) # different way to write anonymous functions
    IO.puts "7 - 6 = #{get_less.(7, 6)}"
  
    add_sum = fn
      {x, y} -> IO.puts "#{x} + #{y} = #{x + y}"
      {x, y, z} -> IO.puts "#{x} + #{y} + #{z} = #{x + y + z}"
    end

    add_sum.({1, 2})
    add_sum.({1, 2, 3})

    IO.puts do_it()
  end

  def do_it(x \\ 1, y \\ 1) do
    x + y
  end
end
