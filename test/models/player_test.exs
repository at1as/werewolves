defmodule Werewolves.PlayerTest do
  use Werewolves.ModelCase

  alias Werewolves.Player

  @valid_attrs %{name: "some content", number: "some content", role: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Player.changeset(%Player{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Player.changeset(%Player{}, @invalid_attrs)
    refute changeset.valid?
  end
end
