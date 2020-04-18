# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    response = Rails.cache.fetch(Movie.cache_key_with_version, expires_in: 12.hours) do
      movies = Movie.order('created_at ASC').all
      MovieSerializer.new(movies).serialized_json
    end

    render json: response
  end
end
