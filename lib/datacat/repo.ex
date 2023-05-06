defmodule Datacat.Repo do

  use AshPostgres.Repo, otp_app: :datacat

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end

end
