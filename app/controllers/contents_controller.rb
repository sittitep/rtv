class ContentsController < ApplicationController
  def index
    contents = Content.order("created_at ASC").all

    render json: ContentSerializer.new(contents).serialized_json
  end
end
