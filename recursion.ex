defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    IO.puts "Factorial of 3: #{factorial(3)}"
    IO.puts "Factorial of 4: #{factorial(4)}"
    IO.puts "Factorial of 6: #{factorial(6)}"
  end

  def factorial(num) do
      if num <= 1 do
        1
      else
        result = num * factorial(num - 1)
        result
      end
  end
end