defmodule Rundot.Run do
  use Rundot.Web, :model

  schema "runs" do
    field :start_time, Ecto.DateTime
    field :end_time, Ecto.DateTime
    field :distance, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:start_time, :end_time, :distance])
    |> validate_required([:start_time, :end_time, :distance])
  end
end
