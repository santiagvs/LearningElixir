defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    age = 16

    if age >= 18 do
      IO.puts "Can vote"
    else
      IO.puts "Can't vote"
    end

    unless age === 18 do
      IO.puts "You are not 18"
    else
      IO.puts "You are 18"
    end

    cond do
      age >= 18 -> IO.puts "You can vote"
      age >= 16 -> IO.puts "You can drive"
      age >= 14 -> IO.puts "You can wait"
      true -> IO.puts "Default"
    end

    IO.puts "Vote and Drive: #{(age >= 16) and (age >= 18)}"
    IO.puts "Vote and Drive: #{(age >= 16) or (age >= 18)}"
  end
 #c("elixirtut.ex")
end