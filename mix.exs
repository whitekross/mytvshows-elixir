defmodule Mytvshows.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mytvshows,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Mytvshows.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:ecto, "~> 2.0"},
    {:postgrex, "~> 0.11"},
    {:seedex, "~> 0.1.3"}]
  end

  defp aliases do 
    ["ecto.setup": ["ecto.create", "ecto.migrate", "seedex.seed"],
    "ecto.reset": ["ecto.drop", "ecto.setup"]] 
  end 
end
