defmodule PickendTest do
  use ExUnit.Case
  doctest Pickend

  test "greets the world" do
    assert Pickend.hello() == :world
  end
end
