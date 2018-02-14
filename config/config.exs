# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api_tralix,
  ecto_repos: [ApiTralix.Repo]

# Configures the endpoint
config :api_tralix, ApiTralixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J54+V12ICotNmfYxKc4KL4By/L+HlqPuMQrQuCx35tHJtEn0aKNhNMV+hTqFd050",
  render_errors: [view: ApiTralixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ApiTralix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
