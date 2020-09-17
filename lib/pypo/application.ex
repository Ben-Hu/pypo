defmodule Pypo.Application do
  use Application

  def start(_type, _args) do
    children = [
      {NimblePool, worker: {Pypo.Nimble, "foo.bar"}, pool_size: 10, name: Pypo.Nimble}
    ]

    opts = [strategy: :one_for_one, name: Pypo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
