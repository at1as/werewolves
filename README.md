# Werewolves

Werewolves role playing game, without the cards (also known as [Mafia](https://en.wikipedia.org/wiki/Mafia_(party_game)), with slightly different role names). 

Users will be texted their assigned role at the beginning of the game, and again when their status changes, if they become entagled with another player, or during a character reveal. This eliminates a lot of the awkwardness of secretly showing players others' cards.


#### Screenshots

*Players*
<p align="center">
  <img src="http://at1as.github.io/github_repo_assets/werewolves-1.png" width="600px"/>
</p>

*Gameplay*
<p align="center">
  <img src="http://at1as.github.io/github_repo_assets/werewolves-3.png" width="600px"/>
</p>


#### Setup

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`

Tested with `Elixir 1.3.3` on top of `Erlang/OTP 19` running on OS X.


#### Launching server

To launch the game, three environment variables are required

  * `TWILIO_ACCOUNT_SID` (your twilio account SID)
  * `TWILIO_AUTH_TOKEN` (your twilio account auth token)
  * `FROM` (the from number belonging to your account you wish to make outgoing texts with)


`TWILIO_ACCOUNT_SID="AC..." TWILIO_AUTH_TOKEN="12345" FROM="+15555555555" mix phoenix server`

Note that the game will still launch and function without these environment variables set, however it's of severely limited use without its texting ability.
