class PurchasesController < ApplicationController
  def create
    purchase = Purchase.new(user_id: purchase_params[:user_id], expired_at: 2.days.from_now)
    purchase.purchase_items.new(purchase_option_id: params[:purchase_option_id])

    purchase.save

    render json: PurchaseSerializer.new(purchase).serialized_json
  end

private

  def purchase_params
    params.permit([:user_id, :purchase_option_id])
  end
end
