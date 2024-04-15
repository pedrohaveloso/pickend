defmodule Pickend.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, plug: PickendWeb.Router}
    ]

    opts = [strategy: :one_for_one, name: Pickend.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
