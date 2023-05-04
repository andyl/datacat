defmodule Datacat.Afm.Support do
  use Ash.Api

  resources do
    # This defines the set of resources that can be used with this API
    registry Datacat.Afm.Support.Registry
  end
end
