# frozen_string_literal: true

class PurchaseOption < ApplicationRecord
  belongs_to :content
  has_many :purchase_items
end
