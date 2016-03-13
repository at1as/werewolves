defmodule Werewolves.Repo.Migrations.AddEntagledToPlayers do
  use Ecto.Migration

  def change do
    alter table(:players) do
      add :entagled, :boolean
    end
  end
end
