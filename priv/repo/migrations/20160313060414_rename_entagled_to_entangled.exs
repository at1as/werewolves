defmodule Werewolves.Repo.Migrations.RenameEntagledToEntangled do
  use Ecto.Migration
  
  def up do
    "ALTER TABLE players ADD COLUMN entangled boolean"
  end

  def down do
    "ALTER TABLE players DROP COLUMN entagled"
  end
end
