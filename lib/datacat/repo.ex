defmodule Datacat.Repo do
  use Ecto.Repo,
    otp_app: :datacat,
    adapter: Ecto.Adapters.Postgres
end