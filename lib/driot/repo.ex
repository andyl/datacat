defmodule Driot.Repo do
  use Ecto.Repo,
    otp_app: :driot,
    adapter: Ecto.Adapters.Postgres
end
