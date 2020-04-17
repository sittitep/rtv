# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one :content, as: :resource
end
