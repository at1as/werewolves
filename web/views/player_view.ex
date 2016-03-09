defmodule Werewolves.PlayerView do
  use Werewolves.Web, :view

  def connection_keys(conn) do
    IO.puts("TEST!!!!1")
    IO.puts(conn)
    #[17]
    #IO.puts(Map.from_struct(conn) |> Map.keys)
    [length(Repo.all(Player))]
    #IO.puts("TEST DONE")
  end
end
