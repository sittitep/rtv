# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    movies = Movie.order('created_at ASC').all

    render json: MovieSerializer.new(movies).serialized_json
  end
end
