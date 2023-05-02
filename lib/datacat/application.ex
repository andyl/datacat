defmodule Datacat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DatacatWeb.Telemetry,
      # Start the Ecto repository
      Datacat.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Datacat.PubSub},
      # Start Finch
      {Finch, name: Datacat.Finch},
      # Start the Endpoint (http/https)
      DatacatWeb.Endpoint
      # Start a worker by calling: Datacat.Worker.start_link(arg)
      # {Datacat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Datacat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DatacatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
