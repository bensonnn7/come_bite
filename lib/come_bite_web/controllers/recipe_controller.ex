defmodule ComeBiteWeb.RecipeController do
  use ComeBiteWeb, :controller
  alias ComeBite.Recipes
  alias ComeBite.Recipes.Recipe

  action_fallback ComeBiteWeb.FallbackController

  # Lists all recipes
  def index(conn, _params) do
    recipes = Recipes.list_recipes()
    json(conn, %{data: recipes})
  end

  # Shows a single recipe
  def show(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    json(conn, %{data: recipe})
  end

  # Creates a new recipe
  def create(conn, %{"recipe" => recipe_params}) do
    case Recipes.create_recipe(recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.recipe_path(conn, :show, recipe))
        |> json(%{data: recipe})

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset})
    end
  end

  # Update an existing recipe
  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Recipes.get_recipe!(id)

    case Recipes.update_recipe(recipe, recipe_params) do
      {:ok, recipe} ->
        json(conn, %{data: recipe})

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset})
    end
  end

  # Deletes a recipe
  def delete(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)

    with {:ok, %Recipe{}} <- Recipes.delete_recipe(recipe) do
      send_resp(conn, :no_content, "")
    end
  end
end
