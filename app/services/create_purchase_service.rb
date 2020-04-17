class CreatePurchaseService
  def self.call(args)
    new.call(args)
  end

  def call(user_id:, purchase_option_id:)
    purchase = Purchase.new(user_id: user_id, expired_at: 2.days.from_now)
    purchase.purchase_items.new(purchase_option_id: purchase_option_id)

    purchase.save && purchase
  end
end
