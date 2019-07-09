# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :email_event_sink,
  ecto_repos: [EmailEventSink.Repo]

# Configures the endpoint
config :email_event_sink, EmailEventSinkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1L6GKdD05UhPF9exqiA2yf1xfTov4JHxcvL1o3Dr1mf9IAwguU1M8DZqsqqZ1liM",
  render_errors: [view: EmailEventSinkWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: EmailEventSink.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$date $time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
