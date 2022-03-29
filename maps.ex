defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    capitals = %{
        "Alabama" => "Montgomery",
        "Alaska" => "Juneau",
        "Arizona" => "Phoenix"
    }

    IO.puts "Capital of Alaska is #{capitals["Alaska"]}"

    capitals_in_atom = %{
        alabama: "Montgomery",
        alaska: "Juneau",
        arizona: "Phoenix"
    }

    IO.puts "Capital of Arizona is #{capitals_in_atom.arizona}"

    capitals3 = Map.put_new(capitals, "Arkansas", "Little Rock")
  end
  
  def display_list([word|words]) do
    IO.puts word
    display_list(words)
  end

  def display_list([]), do: nil
end