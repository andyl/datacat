defmodule Datacat.Afm.Accounts do

  use Ash.Api, extensions: [AshAdmin.Api]

  resources do
    registry Datacat.Afm.Accounts.AfmRegistry
  end

  admin do
    show?(true)
  end
end

