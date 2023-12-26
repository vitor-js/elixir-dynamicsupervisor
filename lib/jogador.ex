defmodule Jogador do
  use GenServer

  def init({name, jogo_id}) do
    pid = self()
    {:ok, %{name: name, jogo_id: jogo_id, pid: pid}}
  end

  def start_link({name, jogo_id}) do
    GenServer.start_link(__MODULE__, {name, jogo_id}, name: {:global, "jogador:#{name}"})
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  ### public
  def get(pid), do: GenServer.call(pid, :get)
end
