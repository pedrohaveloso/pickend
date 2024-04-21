import Config

config :pickend, Pickend.Repo,
  database: "pickend_repo",
  username: "postgres",
  password: "root",
  hostname: "db",
  port: "5432"

config :pickend, ecto_repos: [Pickend.Repo]
