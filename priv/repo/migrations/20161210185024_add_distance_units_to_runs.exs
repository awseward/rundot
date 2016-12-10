defmodule Rundot.Repo.Migrations.AddDistanceUnitsToRuns do
  use Ecto.Migration

  def change do
    alter table(:runs) do
      add :distance_unit, :integer, null: false, default: 0
    end
  end
end
