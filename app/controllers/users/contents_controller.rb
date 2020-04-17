class Users::ContentsController < ApplicationController
  def index
    contents = QueryUserContentService.call(user_id: params[:user_id])

    render json: UserContentSerializer.new(contents).serialized_json
  end
end
