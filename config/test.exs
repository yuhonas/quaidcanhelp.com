use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :learntlist, LearntlistWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :learntlist, Learntlist.Repo,
  database: "learntlist_test",
  pool: Ecto.Adapters.SQL.Sandbox

import_config "database.secret.exs"
