class PurchaseItem < ApplicationRecord
  belongs_to :purchase
  belongs_to :purchase_option
end
