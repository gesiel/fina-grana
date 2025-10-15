defmodule FinaGrana.Core do
  use Ash.Domain, otp_app: :fina_grana, extensions: [AshGraphql.Domain]

  resources do
    resource FinaGrana.Core.Tenant do
      define :create_tenant, action: :create
      define :read_tenants, action: :read
      define :get_tenant_by_id, action: :read, get_by: :id
      define :update_tenant, action: :update
    end
  end

  graphql do
    queries do
      get FinaGrana.Core.Tenant, :get_tenant_by_id, :read
      list FinaGrana.Core.Tenant, :search_tenants, :read
    end

    mutations do
      create FinaGrana.Core.Tenant, :create_tenant, :create
      update FinaGrana.Core.Tenant, :update_tenant, :update
    end
  end
end
