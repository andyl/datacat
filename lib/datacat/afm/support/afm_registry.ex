defmodule Datacat.Afm.Support.AfmRegistry do
  use Ash.Registry

  entries do
    entry Datacat.Afm.Support.Ticket
    entry Datacat.Afm.Support.Representative
  end
end
