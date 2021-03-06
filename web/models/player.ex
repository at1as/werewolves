defmodule Werewolves.Player do
  use Werewolves.Web, :model

  schema "players" do
    field :name, :string
    field :number, :string
    field :role, :string
    field :alive, :boolean
    field :entangled, :boolean

    timestamps
  end

  @required_fields ~w(name number)
  @optional_fields ~w(role alive entangled)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
