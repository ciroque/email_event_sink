use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :email_event_sink, EmailEventSinkWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :email_event_sink, EmailEventSink.Repo,
#  username: "email_event_sink_rw",
#  password: "happyhoundscattraining",
  username: "postgres",
  password: "postgres",
  database: "email_event_sink_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
