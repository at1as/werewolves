defmodule Werewolves.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :number, :string
      add :role, :string

      timestamps
    end

  end
end
