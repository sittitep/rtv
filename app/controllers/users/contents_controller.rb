class Users::ContentsController < ApplicationController
  def index
    contents = Content
      .joins(purchase_options: {purchase_items: :purchase})
      .where(purchases: {user_id: params[:user_id]})
      .select("*, purchases.expired_at AS purchase_expired_at")
      .order("purchases.expired_at ASC")

    render json: UserContentSerializer.new(contents).serialized_json
  end
end
