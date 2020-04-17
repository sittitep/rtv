class Content < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_many :purchase_options
end
