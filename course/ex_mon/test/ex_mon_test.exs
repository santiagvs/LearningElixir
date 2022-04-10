defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      expected_response = %Player{
        life: 100,
        moves: %{move_avg: :tiro, move_heal: :laranja, move_rnd: :facada},
        name: "Pedro"
      }

      assert expected_response == ExMon.create_player("Pedro", :tiro, :facada, :laranja)
    end
  end

  describe "start_game/1" do
    test "returns a message when game is started" do
      player = Player.build("Pedro", :tiro, :facada, :laranja)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "The game has started!"
      assert messages =~ "status"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Pedro", :tiro, :facada, :laranja)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "do the move and let computer make a move when the move is valid" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:tiro)
        end)

      assert messages =~ "Player attacked computer"
      assert messages =~ "It's player turn!"
      assert messages =~ "It's computer turn"
      assert messages =~ "status: :continue"
    end

    test "returns an error message when the move is invalid" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:zuado)
        end)

      assert messages =~ "Invalid move zuado!"
    end
  end
end
