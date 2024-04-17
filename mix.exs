defmodule Pickend.MixProject do
  use Mix.Project

  def project do
    [
      app: :pickend,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Pickend.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:bandit, "~> 1.4"},
      {:jason, "~> 1.4"},
      {:argon2_elixir, "~> 4.0"}
    ]
  end
end
