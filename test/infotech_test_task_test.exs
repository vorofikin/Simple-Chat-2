defmodule InfotechTestTaskTest do
  use ExUnit.Case
  doctest InfotechTestTask

  test "greets the world" do
    assert InfotechTestTask.hello() == :world
  end
end
