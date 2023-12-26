defmodule Init do
  def inicio(jogo_id \\ "jogo_1") do
    Jogo.start_link(jogo_id)
    Dynamic.Supervisor.start_link()
  end

  def adicionar_jogador(name, jogo_id) do
    Dynamic.Supervisor.adicionar_jogador(name, jogo_id)
  end

  def remover_jogador(name, jogo_id) do
    jogadores()
    |> Enum.each(fn
      %{jogo_id: ^jogo_id, name: ^name, pid: pid} -> Dynamic.Supervisor.remover_jogador(pid)
      _ -> nil
    end)
  end

  def jogadores() do
    for {_, pid, _, [modulo]} <- Dynamic.Supervisor.jogadores(), do: apply(modulo, :get, [pid])
  end

  def total() do
    Dynamic.Supervisor.total()
  end
end
