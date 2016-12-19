defmodule Werewolves.PageController do
  use Werewolves.Web, :controller

  def index(conn, _params) do
    conn 
    |> redirect(to: player_path(conn, :index))
  end
end
