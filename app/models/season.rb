# frozen_string_literal: true

class Season < ApplicationRecord
  has_one :content, as: :resource
  has_many :episodes
end
