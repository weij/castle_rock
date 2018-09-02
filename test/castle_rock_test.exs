defmodule CastleRockTest do
  use ExUnit.Case
  doctest CastleRock

  test "greets the world" do
    assert CastleRock.hello() == :world
  end
end
