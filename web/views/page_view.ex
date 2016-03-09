defmodule Werewolves.PageView do
  use Werewolves.Web, :view
  
  #def player_count do
  #  Repo.all(Role).count
  #end

  def connection_keys(conn) do
    IO.puts("TEST!!!!1")
    IO.puts(Map.from_struct(conn)
    |> Map.keys)
  end
end
