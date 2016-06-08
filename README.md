# Werewolves

To launch the game, follow the following steps

#### Setup

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`


#### Launching server

To launch the game, three environment variables are required

  * `TWILIO_ACCOUNT_SID` (your twilio account SID)
  * `TWILIO_AUTH_TOKEN` (your twilio account auth token)
  * `FROM` (the from number belonging to your account you wish to make outgoing texts with)


`TWILIO_ACCOUNT_SID="AC..." TWILIO_AUTH_TOKEN="12345" FROM="+15555555555" mix phoenix server`

