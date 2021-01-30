# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :nato, NatoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d5A1jhpsUPnY/0efdX9+VN4x+9cGB3sIlWoM7ISTfNfuLwHfs+3D1jSKrsfZvtws",
  render_errors: [view: NatoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nato.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "uqLwsMtkaXizTxpWnQMaBV7vB5Ll4W+P"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
