class PurchaseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :expired_at
end
