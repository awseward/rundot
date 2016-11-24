defmodule Rundot.RunTest do
  use Rundot.ModelCase

  alias Rundot.Run

  @valid_attrs %{distance: "120.5", end_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Run.changeset(%Run{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Run.changeset(%Run{}, @invalid_attrs)
    refute changeset.valid?
  end
end
