defmodule FinaGrana.Core do
  use Ash.Domain,
    otp_app: :fina_grana

  resources do
    resource FinaGrana.Core.Tenant do
      define :create_tenant, action: :create
    end
  end
end
