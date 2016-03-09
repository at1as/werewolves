defmodule Werewolves.PageController do
  use Werewolves.Web, :controller

  def index(conn, _params) do
    players = length(Repo.all(Werewolves.Player))
    render conn, "index.html", players: players
  end
end
