# frozen_string_literal: true

class PurchaseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :expired_at
end
