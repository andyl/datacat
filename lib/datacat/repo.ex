defmodule Datacat.Repo do
  # use Ecto.Repo,
  use AshPostgres.Repo, otp_app: :datacat
    # adapter: Ecto.Adapters.Postgres
end
