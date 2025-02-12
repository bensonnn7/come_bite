defmodule ComeBite.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ComeBite.Recipes` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        cooking_time: 42,
        description: "some description",
        flavor: [1, 2],
        images: ["option1", "option2"],
        ingredients: [1, 2],
        instruction: "some instruction",
        name: "some name"
      })
      |> ComeBite.Recipes.create_recipe()

    recipe
  end
end
