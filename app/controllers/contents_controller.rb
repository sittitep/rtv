# frozen_string_literal: true

class ContentsController < ApplicationController
  def index
    contents = Rails.cache.fetch('contents_index', expires_in: 12.hours) do
      Content.order('created_at ASC').all
    end

    render json: ContentSerializer.new(contents).serialized_json
  end
end
