defmodule Pypo.MixProject do
  use Mix.Project

  def project do
    [
      app: :pypo,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Pypo.Application, []}
    ]
  end

  defp deps do
    [
      {:nimble_pool, "~> 0.2.0"},
      {:benchee, "~> 1.0"}
    ]
  end
end
