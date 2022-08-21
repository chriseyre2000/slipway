# Slipway

[logo]: https://github.com/chriseyre2000/slipway/blob/main/hs-spender-UsfuL6i_SWQ-unsplash.jpg "Image"

This is an addon that includes a generator for creating Dockerfiles.

This is heavily based upon this article:

https://pentacent.medium.com/getting-started-with-elixir-docker-982e2a16213c

## Installation

Either

Copy the release file to your machine and use `archive.install slipway-0.1.0.ez`

or

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `test_app` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:slipway, "~> 0.1.0"}
  ]
end
```


## Usage

The following generator will create a template dockerfile.

`mix slipway.gen.docker`

It will probably require further customisation, but this is a working baseline that uses mix release.


