defmodule Pizzaria.Repo do
  use Ecto.Repo,
    otp_app: :pizzaria,
    adapter: Ecto.Adapters.Postgres
end
