defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    age = 16
    
    my_stats = {175, 6.25, :Pedro}

    IO.puts "Tuple #{is_tuple(my_stats)}"

    my_stats2 = Tuple.append(my_stats, 42)

    IO.puts "Age: #{elem(my_stats2, 3)}"

    IO.puts "Size: #{tuple_size(my_stats2)}"

    my_stats3 = Tuple.delete_at(my_stats2, 0)

    my_stats4 = Tuple.insert_at(my_stats3, 0, 2002)
  
    many_zeroes = Tuple.duplicate(0, 5)

    {weight, height, name} = {175, 6.25, :Pedro}
    IO.puts "Weight: #{(weight)}"
  end
end