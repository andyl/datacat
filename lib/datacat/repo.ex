defmodule Datacat.Repo do

  # use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  use AshPostgres.Repo, otp_app: :datacat
end
