defmodule Rundot.Repo.Migrations.ChangeRunPrimaryKeyToUuids do
  use Ecto.Migration

  # Unfortunately, this migration loses all data in the runs table
  # going both ways...

  def up do
    drop table(:runs)

    create table(:runs, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :start_time, :datetime
      add :end_time, :datetime
      add :distance, :float
      add :distance_unit, :integer, null: false, default: 0

      timestamps()
    end
  end

  def down do
    drop table(:runs)

    create table(:runs) do
      add :start_time, :datetime
      add :end_time, :datetime
      add :distance, :float
      add :distance_unit, :integer, null: false, default: 0

      timestamps()
    end
  end
end
