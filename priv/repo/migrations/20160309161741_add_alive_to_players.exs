defmodule Werewolves.Repo.Migrations.AddAliveToPlayers do
  use Ecto.Migration

  def change do
    alter table(:players) do
      add :alive, :boolean
    end
  end
end
