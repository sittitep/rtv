class SeasonsController < ApplicationController
  def index
    seasons = Season.order("created_at ASC").all

    render json: SeasonSerializer.new(seasons).serialized_json
  end
end
