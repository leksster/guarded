use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :guarded, GuardedWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :guarded, Guarded.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "leksster",
  password: "12345678",
  database: "guarded_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
