defmodule Pypo.Server do
  use GenServer

  def command(command) do
    pid = self()
    ref = make_ref()

    {:ok, _} = GenServer.start_link(__MODULE__, {command, pid, ref})

    receive do
      {^ref, {:data, data}} -> data
    end
  end

  @impl GenServer
  def init({command, pid, ref}) do
    python = System.find_executable("python")
    python_path = Path.join(:code.priv_dir(:pypo), "python")

    port =
      Port.open({:spawn_executable, python}, [
        :binary,
        :exit_status,
        :stderr_to_stdout,
        cd: python_path,
        args: ["-m", "foo.bar"]
      ])

    Port.command(port, [command, "\n"])

    {:ok, {command, pid, ref}}
  end

  @impl GenServer
  def handle_info({_port, {:data, _data} = msg}, {_command, pid, ref} = state) do
    send(pid, {ref, msg})
    {:stop, :normal, state}
  end
end

defmodule Pypo.Nimble do
  @behaviour NimblePool

  def command(command, opts \\ []) do
    pool_timeout = Keyword.get(opts, :pool_timeout, 5000)
    receive_timeout = Keyword.get(opts, :receive_timeout, 15000)

    NimblePool.checkout!(
      __MODULE__,
      :checkout,
      fn {_pid, _ref}, port ->
        Port.command(port, [command, "\n"])

        receive do
          {^port, {:data, data}} ->
            try do
              Port.close(port)
              {data, :close}
            rescue
              _ -> {data, :close}
            end
        after
          receive_timeout ->
            exit(:receive_timeout)
        end
      end,
      pool_timeout
    )
  end

  @impl NimblePool
  def init_worker(module) do
    python = System.find_executable("python")
    python_path = Path.join(:code.priv_dir(:pypo), "python")

    port =
      Port.open({:spawn_executable, python}, [
        :binary,
        :exit_status,
        :stderr_to_stdout,
        cd: python_path,
        args: ["-m", module]
      ])

    {:ok, port, module}
  end

  @impl NimblePool
  def handle_checkout(:checkout, {pid, _}, port, module) do
    Port.connect(port, pid)
    {:ok, port, port, module}
  end

  @impl NimblePool
  def handle_checkin(:ok, _from, port, module) do
    {:ok, port, module}
  end

  def handle_checkin(:close, _from, _port, module) do
    {:remove, :closed, module}
  end

  @impl NimblePool
  def terminate_worker(_reason, _port, module) do
    {:ok, module}
  end
end
