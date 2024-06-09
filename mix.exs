defmodule InfotechTestTask.MixProject do
  use Mix.Project

  def project do
    [
      app: :infotech_test_task,
      version: "0.1.0",
      elixir: "~> 1.16",
      erlang: "24.0",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps()
    ]
  end

  def package do
    [
      licenses: ["ISC"],
      name: :infotech_test_task
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :xmerl, :crypto],
      mod: {InfotechTestTask, []},
      applications: [:ranch, :cowboy, :logger, :n2o, :syn, :nitro, :xmerl, :cowlib, :public_key]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.29.0", only: :dev},
      {:cowboy, "~> 2.8.0"},
      {:syn,"~> 2.1.1"},
      {:nitro, "~> 7.4.1"},
      {:n2o, "~> 10.12"}
    ]
  end
end
