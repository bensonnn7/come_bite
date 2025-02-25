defmodule ComeBite.MealPlanner do
  alias ComeBite.Recipes

  def generate_meal do
    recipes = Recipes.list_recipes()
    # TODO: filter by flavor, category, etc.
    # Select 7 recipes based on ingredients
    selected_recipes =
      # ++ joins these lists together into a single list.
      select_meals(recipes, "chicken", 2) ++
      select_meals(recipes, "beef", 2) ++
      select_meals(recipes, "pork", 2) ++
      select_meals(recipes, "fish", 1)

    # 3. Return the selected recipes
    %{data: selected_recipes}
  end

  #  private function inside a module.
  defp select_meals(recipes, ingredient, count) do
    recipes
    # Enum.filter(collection, function)
    # Enum.member?(collection, value): Returns true if the value is a member of the collection.
    |> Enum.filter(fn recipe -> Enum.member?(recipe.ingredients, ingredient) end)
    # Enum.take_random(collection, count)
    |> Enum.take_random(count)
  end
end
