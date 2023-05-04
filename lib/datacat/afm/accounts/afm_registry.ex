defmodule Datacat.Afm.Accounts.AfmRegistry do
  use Ash.Registry, extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry Datacat.Afm.Accounts.User
    entry Datacat.Afm.Accounts.Token
  end
end
