# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :mytvshows, Mytvshows.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "mytvshows_repo_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

