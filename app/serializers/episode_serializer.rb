# frozen_string_literal: true

class EpisodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :plot, :number
end
