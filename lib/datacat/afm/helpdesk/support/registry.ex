defmodule Datacat.Afm.Support.Registry do
  use Ash.Registry

  entries do
    entry Datacat.Afm.Support.Ticket
    entry Datacat.Afm.Support.Representative
  end
end
