defmodule ComeBite.Repo do
  use Ecto.Repo,
    otp_app: :come_bite,
    adapter: Ecto.Adapters.Postgres
end
