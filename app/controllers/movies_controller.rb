# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    movies = Rails.cache.fetch('movies_index', expires_in: 12.hours) do
      Movie.order('created_at ASC').all
    end

    render json: MovieSerializer.new(movies).serialized_json
  end
end
