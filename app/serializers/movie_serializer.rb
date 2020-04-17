# frozen_string_literal: true

class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :plot
end
