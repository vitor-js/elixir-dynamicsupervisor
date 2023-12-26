defmodule Jogo do
  use GenServer

  def init(jogo_id) do
    {:ok, %{jogo_id: jogo_id}}
  end

  def start_link(jogo_id) do
    GenServer.start_link(__MODULE__, jogo_id: jogo_id, name: {:global, "jogo:#{jogo_id}"})
  end
end
