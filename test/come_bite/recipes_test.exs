defmodule ComeBite.RecipesTest do
  use ComeBite.DataCase

  alias ComeBite.Recipes

  describe "recipes" do
    alias ComeBite.Recipes.Recipe

    import ComeBite.RecipesFixtures

    @invalid_attrs %{name: nil, description: nil, instruction: nil, ingredients: nil, flavor: nil, images: nil, cooking_time: nil}

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Recipes.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Recipes.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      valid_attrs = %{name: "some name", description: "some description", instruction: "some instruction", ingredients: [1, 2], flavor: [1, 2], images: ["option1", "option2"], cooking_time: 42}

      assert {:ok, %Recipe{} = recipe} = Recipes.create_recipe(valid_attrs)
      assert recipe.name == "some name"
      assert recipe.description == "some description"
      assert recipe.instruction == "some instruction"
      assert recipe.ingredients == [1, 2]
      assert recipe.flavor == [1, 2]
      assert recipe.images == ["option1", "option2"]
      assert recipe.cooking_time == 42
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", instruction: "some updated instruction", ingredients: [1], flavor: [1], images: ["option1"], cooking_time: 43}

      assert {:ok, %Recipe{} = recipe} = Recipes.update_recipe(recipe, update_attrs)
      assert recipe.name == "some updated name"
      assert recipe.description == "some updated description"
      assert recipe.instruction == "some updated instruction"
      assert recipe.ingredients == [1]
      assert recipe.flavor == [1]
      assert recipe.images == ["option1"]
      assert recipe.cooking_time == 43
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_recipe(recipe, @invalid_attrs)
      assert recipe == Recipes.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Recipes.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Recipes.change_recipe(recipe)
    end
  end
end
