# Slipway

![logo](./hs-spender-UsfuL6i_SWQ-unsplash.jpg) 
<!--"Image was created by: https://unsplash.com/@h1sts" -->


A slipway is a means of launching a ship.


This is an addon that includes a generator for creating Dockerfiles.

This was initially based upon this article:

https://pentacent.medium.com/getting-started-with-elixir-docker-982e2a16213c but has been adapted to use `mix release` rather than distillery. 

## Installation

This can be installed as an elixir archive (so that is is available to every project or can be specifically added to a given project).

Either

Copy the release file to your machine and use `archive.install slipway-0.1.0.ez`

or

It is [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `slipway` to your list of dependencies in `mix.exs`:

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


