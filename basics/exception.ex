defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    erring = try do 
      5 / 0
    rescue
      ArithmethicError -> "Can't divide by zero"
    end

    IO.puts erring
  end
end