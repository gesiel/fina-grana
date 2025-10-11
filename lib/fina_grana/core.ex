defmodule FinaGrana.Core do
  use Ash.Domain,
    otp_app: :fina_grana

  resources do
    resource FinaGrana.Core.Tenant do
      define :create_tenant, action: :create
      define :read_tenants, action: :read
      define :get_tenant_by_id, action: :read, get_by: :id
    end
  end
end
