defmodule FinaGrana.Core.Tenant do
  use Ash.Resource,
    otp_app: :fina_grana,
    domain: FinaGrana.Core,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "tenants"
    repo FinaGrana.Repo
  end

  attributes do
    uuid_v7_primary_key :id

    attribute :name, :string do
      public? true
      allow_nil? false
    end

    create_timestamp :created_at
    update_timestamp :updated_at
  end

  actions do
    create :create do
      accept [:name]
    end
  end
end
