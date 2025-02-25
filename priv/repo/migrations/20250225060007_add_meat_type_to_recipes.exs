defmodule ComeBite.Repo.Migrations.AddMeatTypeToRecipes do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :meat_type, :string
    end
  end
end
