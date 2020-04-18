# frozen_string_literal: true

class Season < ApplicationRecord
  extend CacheVersion
  include Contentable

  has_one :content, as: :resource
  has_many :episodes
end
