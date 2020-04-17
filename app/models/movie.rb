class Movie < ApplicationRecord
  has_one :content, as: :resource
end
