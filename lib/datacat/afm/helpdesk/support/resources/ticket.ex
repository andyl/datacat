defmodule Datacat.Afm.Support.Ticket do

  use Ash.Resource, data_layer: Ash.DataLayer.Ets

  actions do
    defaults [:create, :read, :update, :destroy]

    create :open do
      accept [:subject]
    end

    update :assign do
      accept []

      argument :representative_id, :uuid do
        allow_nil? false
      end

      change manage_relationship(:representative_id, :representative, type: :append_and_remove)
    end

    update :close do
      accept []

      change set_attribute(:status, :closed)
      # A custom change could be added like so:
      #
      # change MyCustomChange
      # change {MyCustomChange, opt: :val}
    end
  end

  attributes do
    uuid_primary_key :id do
      default &Uniq.UUID.uuid7/0
    end

    attribute :subject, :string do
      allow_nil? false
    end

    attribute :status, :atom do
      constraints [one_of: [:open, :closed]]
      default :open
      allow_nil? false
    end
  end

  relationships do
    belongs_to :representative, Datacat.Afm.Support.Representative
  end

end
