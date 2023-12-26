defmodule Dynamic.Supervisor do
  use DynamicSupervisor

  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_link do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def adicionar_jogador(name, jogo_id) do
    spec = {Jogador, {name, jogo_id}}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def remover_jogador(pid) do
    DynamicSupervisor.terminate_child(__MODULE__, pid)
  end

  def jogadores do
    DynamicSupervisor.which_children(__MODULE__)
  end

  def total do
    DynamicSupervisor.count_children(__MODULE__)
  end
end
