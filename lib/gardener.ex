defmodule Gardener do
  @moduledoc """
    Simple app to build a garden
  """

  @doc """
    Dig a hole to plant a seed
  """
  def dig do
    Agent.start_link fn -> [] end
  end

  def plant_seed({:ok, hole}) do
    Agent.update(hole, fn list -> [:seed|list] end)

    hole
  end

  def plant_seed(hole) do
    Agent.update(hole, fn list -> [:seed|list] end)

    hole
  end

  def grow(hole) do
    Agent.get(hole, fn
      [] -> {:missing_seed, []}
      [_|_] -> {:ok, [:rose] }
    end)
  end

end