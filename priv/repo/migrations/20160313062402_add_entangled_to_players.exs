defmodule Werewolves.Repo.Migrations.AddEntangledToPlayers do
  use Ecto.Migration

  def change do
    alter table(:players) do
      add :entangled, :boolean
    end
  end
end
