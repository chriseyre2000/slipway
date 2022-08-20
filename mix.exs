defmodule Slipway.MixProject do
  use Mix.Project

  def project do
    [
      app: :slipway,
      version: "0.1.0",
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    []
  end

  defp aliases do
    [
      build: &build_releases/1
    ]
  end

  defp build_releases(_) do
    {output, _} = System.cmd("mix", ["archive.build"], env: [{"MIX_ENV", "prod"}])
    IO.puts(output)
  end
end
