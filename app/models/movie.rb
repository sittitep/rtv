# frozen_string_literal: true

class Movie < ApplicationRecord
  extend CacheVersion
  include Contentable

  has_one :content, as: :resource
end
