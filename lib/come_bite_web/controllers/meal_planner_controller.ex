defmodule ComeBiteWeb.MealPlannerController do
  use ComeBiteWeb, :controller
  alias ComeBite.MealPlanner
  # action_fallback ComeBiteWeb.FallbackController

  def generate_meal(conn, _params) do
    plan = MealPlanner.generate_meal()
    # IO.inspect(plan)
    json(conn, %{data: plan})
  end
end
