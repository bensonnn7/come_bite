defmodule ComeBite.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field :name, :string
    field :description, :string
    field :instruction, :string
    field :ingredients, {:array, :integer}
    field :flavor, {:array, :integer}
    field :images, {:array, :string}
    field :cooking_time, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :description, :instruction, :ingredients, :flavor, :images, :cooking_time])
    |> validate_required([:name, :description, :instruction, :ingredients, :flavor, :images, :cooking_time])
  end
end
