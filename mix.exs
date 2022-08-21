defmodule Slipway.MixProject do
  use Mix.Project

  def project do
    [
      app: :slipway,
      version: "0.2.0",
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
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
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
    name: "slipway",
    # These are the default files included in the package
    description: "A set of tools to help you launch.",
    licenses: ["MIT"],
    links: %{"GitHub" => "https://github.com/chriseyre2000/slipway"}
    ]
  end

  defp aliases do
    [
      build: &build_releases/1
    ]
  end

  defp build_releases(_) do
    {output, _} = System.cmd("mix", ["archive.build"], env: [{"MIX_ENV", "prod"}])
    Mix.shell().info(output)
  end
end
