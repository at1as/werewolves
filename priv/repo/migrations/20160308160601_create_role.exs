defmodule Werewolves.Repo.Migrations.CreateRole do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :name, :string
      add :count, :integer

      timestamps
    end

  end
end
