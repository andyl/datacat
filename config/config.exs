import Config

# Configures the endpoint
config :datacat, DatacatWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: DatacatWeb.ErrorHTML, json: DatacatWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Datacat.PubSub,
  live_view: [signing_salt: "PyRoqjU7"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :datacat, Datacat.Mailer, adapter: Swoosh.Adapters.Local

# ----- ash framework, resources and database

config :ash, :use_all_identities_in_manage_relationship?, false
config :datacat, :ash_apis, [Datacat.Afm.Support, Datacat.Afm.Accounts]
config :datacat, ecto_repos: [Datacat.Repo]

# ----- assets

config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.2.7",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
