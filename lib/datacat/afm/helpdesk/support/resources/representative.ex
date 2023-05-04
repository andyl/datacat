defmodule Datacat.Afm.Support.Representative do

  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "representatives"
    repo Datacat.Repo
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id do
      default &Uniq.UUID.uuid7/0
    end

    attribute :name, :string
  end

  relationships do
    has_many :tickets, Datacat.Afm.Support.Ticket
  end
end
