defmodule PhilCollinsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhilCollinsApiWeb.Telemetry,
      PhilCollinsApi.Repo,
      {DNSCluster, query: Application.get_env(:phil_collins_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhilCollinsApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhilCollinsApi.Finch},
      # Start a worker by calling: PhilCollinsApi.Worker.start_link(arg)
      # {PhilCollinsApi.Worker, arg},
      # Start to serve requests, typically the last entry
      PhilCollinsApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhilCollinsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhilCollinsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
