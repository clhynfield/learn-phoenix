import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :chatter, Chatter.Repo,
  database: Path.expand("../chatter_test.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chatter, ChatterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ROEPGMFid8RlXGQjRO6JseExutony5oVEBcxcxS+FaPzH2+9a0UN3XI66WsxYgDA",
  server: true

# In test we don't send emails.
config :chatter, Chatter.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :chatter, :sql_sandbox, true

config :wallaby, driver: Wallaby.Chrome
config :wallaby, :chromedriver, binary: "/nix/store/v04kz7gyw6nfqkzikvz1hzasc4zp7lp7-chromedriver-122.0.6261.57/bin/chromedriver"
