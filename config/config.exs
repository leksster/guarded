# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :guarded,
  ecto_repos: [Guarded.Repo]

# Configures the endpoint
config :guarded, GuardedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IpY+SiSzhrgyoNci8ZZ2iZeeDDxvpUiuMs02AO+PmzoF/Ck+ezhUM5yHlWKiK1mO",
  render_errors: [view: GuardedWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Guarded.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guarded, Guarded.Guardian,
       issuer: "guarded",
       secret_key: "IpY+SiSzhrgyoNci8ZZ2iZeeDDxvpUiuMs02AO+PmzoF/Ck+ezhUM5yHlWKiK1mO"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
