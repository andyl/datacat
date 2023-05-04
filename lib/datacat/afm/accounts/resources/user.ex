defmodule Datacat.Afm.Accounts.User do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication]

  attributes do
    uuid_primary_key :id, do: default &Uniq.UUID.uuid7/0
    attribute :email, :ci_string, allow_nil?: false
    attribute :hashed_password, :string, allow_nil?: false, sensitive?: true
  end

  authentication do
    api Datacat.Afm.Accounts

    strategies do
      password :password do
        identity_field :email
      end
    end

    tokens do
      enabled? true
      token_resource Datacat.Afm.Accounts.Token
      signing_secret fn _, _ ->
        Application.fetch_env(:my_app, :token_signing_secret)
      end
    end
  end

  postgres do
    table "users"
    repo Datacat.Repo
  end

  identities do
    identity :unique_email, [:email]
  end

  # If using policies, add the folowing bypass:
  # policies do
  #   bypass AshAuthentication.Checks.AshAuthenticationInteraction do
  #     authorize_if always()
  #   end
  # end
end
