defmodule Driot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DriotWeb.Telemetry,
      # Start the Ecto repository
      Driot.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Driot.PubSub},
      # Start Finch
      {Finch, name: Driot.Finch},
      # Start the Endpoint (http/https)
      DriotWeb.Endpoint
      # Start a worker by calling: Driot.Worker.start_link(arg)
      # {Driot.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Driot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DriotWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
