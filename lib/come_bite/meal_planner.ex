defmodule ComeBite.MealPlanner do
  alias ComeBite.Recipes

  def generate_meal do
    recipes = Recipes.list_recipes()
    %{data: recipes, message: "Meal planned with #{length(recipes)} recipes!"}
  end
end
