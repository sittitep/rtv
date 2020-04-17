# frozen_string_literal: true

class SeasonsController < ApplicationController
  def index
    seasons = Rails.cache.fetch('seasons_index', expires_in: 12.hours) do
      Season.order('created_at ASC').all
    end

    render json: SeasonSerializer.new(seasons).serialized_json
  end
end
