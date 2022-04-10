defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Player, Game}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Pedro", :tiro, :facada, :laranja)
      computer = Player.build("Robotnik", :bomba, :missil, :abacaxi)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the game current state" do
      player = Player.build("Pedro", :tiro, :facada, :laranja)
      computer = Player.build("Robotnik", :bomba, :missil, :abacaxi)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :bomba, move_heal: :abacaxi, move_rnd: :missil},
          name: "Robotnik"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :tiro, move_heal: :laranja, move_rnd: :facada},
          name: "Pedro"
        },
        status: :started,
        turn: :player
      }

      assert expected_response === Game.info()
    end
  end

  describe "update/1" do
    test "returns the updated game state" do
      player = Player.build("Pedro", :tiro, :facada, :laranja)
      computer = Player.build("Robotnik", :bomba, :missil, :abacaxi)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :bomba, move_heal: :abacaxi, move_rnd: :missil},
          name: "Robotnik"
        },
        player: %ExMon.Player{
          life: 100,
          moves: %{move_avg: :tiro, move_heal: :laranja, move_rnd: :facada},
          name: "Pedro"
        },
        status: :started,
        turn: :player
      }

      assert expected_response === Game.info()

      new_state = %{
        computer: %ExMon.Player{
          life: 85,
          moves: %{move_avg: :bomba, move_heal: :abacaxi, move_rnd: :missil},
          name: "Robotnik"
        },
        player: %ExMon.Player{
          life: 50,
          moves: %{move_avg: :tiro, move_heal: :laranja, move_rnd: :facada},
          name: "Pedro"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)
      
      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end

  describe "player/0" do
    test "gets info of the player" do
      player = Player.build("Pedro", :tiro, :facada, :laranja)
      computer = Player.build("Robotnik", :bomba, :missil, :abacaxi)

      Game.start(computer, player)

      Game.info()
      assert Game.player() == Map.get(Game.info(), :player)
    end
  end

  describe "turn/0" do
    test "returns the current turn player" do
      player = Player.build("Pedro", :tiro, :facada, :laranja)
      computer = Player.build("Robotnik", :bomba, :missil, :abacaxi)

      Game.start(computer, player)

      Game.info()
      assert Game.turn() == Map.get(Game.info(), :turn)     
    end
  end

  describe "fetch_player/1" do
    test "returns the player" do
      player = Player.build("Pedro", :tiro, :facada, :laranja)
      computer = Player.build("Robotnik", :bomba, :missil, :abacaxi)

      Game.start(computer, player)

      Game.info()
      assert Game.fetch_player(player) == Map.get(Game.info(), player)
    end
  end
end
