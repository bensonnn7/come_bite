defmodule ComeBite.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string
      add :description, :text
      add :instruction, :text
      add :ingredients, {:array, :integer}
      add :flavor, {:array, :integer}
      add :images, {:array, :string}
      add :cooking_time, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
