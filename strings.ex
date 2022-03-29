defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    my_str = "My Sentence"
    IO.puts "Length: #{String.length(my_str)}"
    longer_str = my_str <> " " <> "is longer"
  
    IO.inspect String.split(longer_str, " ")

    IO.puts String.reverse(longer_str)
    IO.puts String.upcase(longer_str)
    IO.puts String.downcase(longer_str)
    IO.puts String.capitalize(longer_str)

    IO.puts "My ? #{String.contains?(my_str, "My")}"

    IO.puts "First: #{String.first(my_str)}"

    IO.puts "Index 4: #{String.at(my_str, 4)}"

    IO.puts "Substring: #{String.slice(my_str, 3, 6)}"
  end

end