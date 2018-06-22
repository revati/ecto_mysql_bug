defmodule Bug.Repo.Migrations.CreatePrimaryModuleTable do
  use Ecto.Migration

  def change do
    create table(:primary_module) do
      add :title, :string, null: false
    end
  end
end
