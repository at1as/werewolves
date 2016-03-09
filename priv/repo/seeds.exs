# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Werewolves.Repo.insert!(%Werewolves.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


Werewolves.Repo.insert!(%Werewolves.Role{name: "Werewolf", count: 0})
Werewolves.Repo.insert!(%Werewolves.Role{name: "Fortune Teller", count: 0})
Werewolves.Repo.insert!(%Werewolves.Role{name: "Hunter", count: 0})
Werewolves.Repo.insert!(%Werewolves.Role{name: "Witch", count: 0})
Werewolves.Repo.insert!(%Werewolves.Role{name: "Little Girl", count: 0})
Werewolves.Repo.insert!(%Werewolves.Role{name: "Cupid", count: 0})
Werewolves.Repo.insert!(%Werewolves.Role{name: "Villager", count: 0})
