defmodule Rundot.Repo.Migrations.CreateRun do
  use Ecto.Migration

  def change do
    create table(:runs) do
      add :start_time, :datetime
      add :end_time, :datetime
      add :distance, :float

      timestamps()
    end

  end
end
