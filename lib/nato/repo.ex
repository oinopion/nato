defmodule Nato.Repo do
  use Ecto.Repo,
    otp_app: :nato,
    adapter: Ecto.Adapters.Postgres
end
