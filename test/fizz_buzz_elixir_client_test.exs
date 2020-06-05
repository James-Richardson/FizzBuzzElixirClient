defmodule FizzBuzzElixirClientTest do
  use ExUnit.Case
  doctest FizzBuzzElixirClient

  test "greets the world" do
    assert FizzBuzzElixirClient.hello() == :world
  end
end
