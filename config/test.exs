import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phil_collins_api, PhilCollinsApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5432,
  database: "phil_collins_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10,
  socket_options: [:inet6]

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phil_collins_api, PhilCollinsApiWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4002],
  secret_key_base: "KMaEG/matXo7LraZ4uflV6OicYxIEwFk1hPGZ06WhDsXkPSSQv6yLMMIDyxFeRe1",
  server: false

# In test we don't send emails.
config :phil_collins_api, PhilCollinsApi.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
