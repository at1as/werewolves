defmodule Werewolves.GameController do
  use Werewolves.Web, :controller

  alias Werewolves.Game

  plug :scrub_params, "game" when action in [:create, :update]

  def overview(conn, _params) do
    player_count = player_count
    assigned_roles = role_count
    render(conn, "overview.html", player_count: player_count, assigned_roles: assigned_roles)
  end

  def index(conn, _params) do
    player_count = player_count
    assigned_roles = role_count
    players = Werewolves.Repo.all(Werewolves.Player)
    {_, has_cupid} = cupid_alive 
    {_, has_little_girl} = little_girl_alive 
    render(conn, "new_game.html", player_count: player_count, assigned_roles: assigned_roles, players: players, has_cupid: has_cupid, has_little_girl: has_little_girl)
  end

  def new(conn, _params) do
    player_count = player_count
    assigned_roles = role_count

    # GET LIST OF PLAYER IDs
    players = Werewolves.Repo.all(Werewolves.Player)
    ids = Enum.map(Werewolves.Repo.all(Werewolves.Player), fn(x) -> x.id end)
    
    # GET LIST OF ROLES
    role_list = List.flatten(Enum.map(Werewolves.Repo.all(Werewolves.Role), fn(x) -> x_times(x.name, x.count) end))

    # ASSIGN EACH PLAYER A ROLE
    Enum.zip(Enum.shuffle(ids), role_list) |> Enum.into(Map.new) |> Enum.map(fn {k, v} -> 
      current_player = Werewolves.Repo.get!(Werewolves.Player, k)
      Werewolves.Repo.update(Werewolves.Player.changeset(current_player, %{role: v, name: current_player.name, number: current_player.number}))
    end)

    # ENSURE ALL PLAYERS ALIVE and UNENTAGLED
    Enum.each(Werewolves.Repo.all(Werewolves.Player), fn(x) ->
      Werewolves.Repo.update(Werewolves.Player.changeset(Werewolves.Repo.get!(Werewolves.Player, x.id), %{alive: true, entangled: false, name: x.name, number: x.number}))
    end)
    
    #render(conn, "new_game.html", player_count: player_count, assigned_roles: assigned_roles, players: players)
    redirect(conn, to: "/games")
  end

  def kill(conn, %{"id" => id}) do
    current_player = Werewolves.Repo.get!(Werewolves.Player, id) 
    if current_player.entangled do
      entangled_players = Enum.filter(Werewolves.Repo.all(Werewolves.Player), fn(x) -> x.entangled end)
      for player <- entangled_players do
        Werewolves.Repo.update(Werewolves.Player.changeset(player, %{alive: false, entangled: false, name: player.name, number: player.number}))
      end
    else
      Werewolves.Repo.update(Werewolves.Player.changeset(current_player, %{alive: false, name: current_player.name, number: current_player.number}))
    end

    redirect(conn, to: "/games")
  end

  def revive(conn, %{"id" => id}) do
    current_player = Werewolves.Repo.get!(Werewolves.Player, id) 
    Werewolves.Repo.update(Werewolves.Player.changeset(current_player, %{alive: true, name: current_player.name, number: current_player.number}))

    redirect(conn, to: "/games")
  end

  def reveal(conn, %{"id" => id}) do
    current_player = Werewolves.Repo.get!(Werewolves.Player, id)
    
    #TODO: TEXT "#{current_player.name} has the role #{current_player.role} to the little_girl"
    redirect(conn, to: "/games")
  end

  def entangle(conn, %{"id" => id}) do
    current_player = Werewolves.Repo.get!(Werewolves.Player, id)
    Werewolves.Repo.update(Werewolves.Player.changeset(current_player, %{entangled: true, name: current_player.name, number: current_player.number}))
    
    redirect(conn, to: "/games")
  end
  
  def role_count do
    roles = Repo.all(Werewolves.Role)
    Enum.reduce(roles, 0, fn(x, acc) -> x.count + acc end)
  end

  def player_count do 
    players = Repo.all(Werewolves.Player)
    length(players)
  end

  def cupid_alive do
    players = Werewolves.Repo.all(Werewolves.Player)
    cupids = Enum.filter(players, fn(x) -> x.role == "Cupid" && x.alive end)
    if length(cupids) > 0 do
      {:ok, true}
    else
      {:ok, false}
    end
  end

  def little_girl_alive do
    players = Werewolves.Repo.all(Werewolves.Player)
    little_girls = Enum.filter(players, fn(x) -> x.role == "Little Girl" && x.alive end)
    if length(little_girls) > 0 do
      {:ok, true}
    else
      {:ok, false}
    end
  end

  def x_times(value, times) do
    list = []
    list = for n <- 0..times, do: list = list ++ [value]
    list = List.delete_at(list, length(list) - 1)
    list
  end
end
