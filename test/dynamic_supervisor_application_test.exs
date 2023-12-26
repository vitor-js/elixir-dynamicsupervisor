defmodule DynamicSupervisorApplicationTest do
  use ExUnit.Case
  doctest DynamicSupervisorApplication

  test "greets the world" do
    assert DynamicSupervisorApplication.hello() == :world
  end
end
