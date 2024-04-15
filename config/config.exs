import Config

config :pickend, Pickend.Repo,
  database: "pickend_repo",
  username: "postgres",
  password: "root",
  hostname: "localhost"

config :pickend, ecto_repos: [Pickend.Repo]
