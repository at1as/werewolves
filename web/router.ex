defmodule Werewolves.Router do
  use Werewolves.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Werewolves do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/players", PlayerController

    resources "/roles", RoleController, only: [:index, :update, :edit]
  end

  # Other scopes may use custom stacks.
  scope "/api", Werewolves do
    pipe_through :api
    resources "/players", PlayerController
  end
end
