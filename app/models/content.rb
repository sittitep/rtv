# frozen_string_literal: true

class Content < ApplicationRecord
  extend CacheVersion

  belongs_to :resource, polymorphic: true
  has_many :purchase_options
end
