# frozen_string_literal: true

class PurchasesController < ApplicationController
  def create
    purchase = CreatePurchaseService.call(
      user_id: purchase_params[:user_id],
      purchase_option_id: params[:purchase_option_id]
    )

    render json: PurchaseSerializer.new(purchase).serialized_json
  end

  private

  def purchase_params
    params.permit(%i[user_id purchase_option_id])
  end
end
