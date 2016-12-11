defmodule Rundot.Repo.Migrations.ChangeRunPrimaryKeyToUuids do
  use Ecto.Migration

  def change do
    alter table(:runs) do
      remove :id
    end

    alter table(:runs) do
      add :id, :uuid, primary_key: true
    end
  end
end
