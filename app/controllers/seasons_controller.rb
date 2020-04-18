# frozen_string_literal: true

class SeasonsController < ApplicationController
  def index
    response = Rails.cache.fetch(Season.cache_key_with_version, expires_in: 12.hours) do
      seasons = Season.order('created_at ASC').all
      SeasonSerializer.new(seasons).serialized_json
    end

    render json: response
  end
end
