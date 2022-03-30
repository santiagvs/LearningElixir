defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    array = [1,2,3]

    IO.puts "Even List: #{
      Enum.all?(
        array, 
      fn(n) -> 
        rem(n, 2) == 0 
        end
      )
    }"

    IO.puts "Even List: #{
      Enum.any?(
        array, 
      fn(n) -> 
        rem(n, 2) == 0 
      end
      )
    }"

    Enum.each(array, fn(n) -> IO.puts n end)

    dbl_list = Enum.map(array, fn(n) -> n * 2 end)
    IO.inspect dbl_list

    sum_values = Enum.reduce(array, fn(n, sum) -> n + sum end)

    IO.puts "Sum: #{sum_values}"
    IO.inspect Enum.uniq([1,2,2])
  end
end
