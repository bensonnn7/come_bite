defmodule ComeBiteWeb.ApiController do
  use ComeBiteWeb, :controller

  def welcome(conn, _params) do
    json(conn, %{message: "Welcome to the ComeBite API!"})
  end
end
