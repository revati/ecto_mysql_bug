# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :bug, ecto_repos: [Bug.Repo]

config :bug, Bug.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "homestead",
  password: "secret",
  database: "mysql_bug",
  hostname: "127.0.0.1",
  port: 33060,
  pool_size: 10,
  migration_primary_key: [id: :uuid, type: :binary_id],
  pool: Ecto.Adapters.SQL.Sandbox

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :bug, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:bug, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
