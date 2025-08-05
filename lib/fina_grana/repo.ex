defmodule FinaGrana.Repo do
  use Ecto.Repo,
    otp_app: :fina_grana,
    adapter: Ecto.Adapters.Postgres
end
