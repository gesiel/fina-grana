defmodule FinaGrana.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FinaGranaWeb.Telemetry,
      FinaGrana.Repo,
      {DNSCluster, query: Application.get_env(:fina_grana, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FinaGrana.PubSub},
      # Start a worker by calling: FinaGrana.Worker.start_link(arg)
      # {FinaGrana.Worker, arg},
      # Start to serve requests, typically the last entry
      FinaGranaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FinaGrana.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FinaGranaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
