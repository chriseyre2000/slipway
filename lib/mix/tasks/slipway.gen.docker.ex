defmodule Mix.Tasks.Slipway.Gen.Docker do
  @moduledoc "Creates a template docker file"
  @shortdoc "Generates a template docker file"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    name = Mix.Project.get()
    app = Mix.Project.config[:app]

    if name == nil do
      Mix.shell().error("No mix.exs found, must be run in an Elixir project")
    else
      Mix.Generator.create_file("Dockerfile", contents(name, app))
      Mix.shell().info(
      """
      You need to run the following to build the docker image:
      `docker build -t elixir-#{app} .`

      Then eithr

      `docker run --rm elixir-#{app}`

      or

      `docker run -it --rm elixir-#{app}`
      """)
    end
  end

  defp contents(name, app) do
    """
    #===========
    #Build Stage
    #===========
    FROM bitwalker/alpine-elixir:1.13 as build

    #Copy the source folder into the Docker image
    COPY . .

    #Install dependencies and build Release
    RUN export MIX_ENV=prod && \
        mix deps.get && \
        mix release --path /export

    # #================
    # #Deployment Stage
    # #================
    FROM pentacent/alpine-erlang-base:latest

    RUN apk add --no-cache openssl ncurses-libs libstdc++

    #Set environment variables and expose port
    EXPOSE 4000
    ENV REPLACE_OS_VARS=true \
        PORT=4000

    #Copy and extract .tar.gz Release file from the previous stage
    COPY --from=build /export/ .

    # #Change user
    USER default

    #Set default entrypoint and command
    ENTRYPOINT ["bin/#{app}", "start"]
    CMD ["foreground"]
    """
  end
end
