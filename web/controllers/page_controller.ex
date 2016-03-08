defmodule Werewolves.PageController do
  use Werewolves.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
