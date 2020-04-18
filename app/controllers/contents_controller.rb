# frozen_string_literal: true

class ContentsController < ApplicationController
  def index
    response = Rails.cache.fetch(Content.cache_key_with_version, expires_in: 12.hours) do
      contents = Content.order('created_at ASC').all
      ContentSerializer.new(contents).serialized_json
    end

    render json: response
  end
end
