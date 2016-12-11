defmodule Rundot.Run do
  use Rundot.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "runs" do
    field :start_time, Ecto.DateTime
    field :end_time, Ecto.DateTime
    field :distance, :float
    field :distance_unit, DistanceUnitEnum

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:start_time, :end_time, :distance, :distance_unit])
    |> validate_required([:start_time, :end_time, :distance, :distance_unit])
  end
end
