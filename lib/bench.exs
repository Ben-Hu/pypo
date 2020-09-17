Benchee.run(
  %{
    "nimble" => fn -> Pypo.Nimble.command("world") end,
    "server" => fn -> Pypo.Server.command("world") end
  },
  time: 10,
  memory_time: 2
)
