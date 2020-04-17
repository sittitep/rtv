class CreatePurchaseService
  def self.call(args)
    new.call(args)
  end

  def call(user_id:, purchase_option_id:)
    user = User.find(user_id)
    purchase_option = PurchaseOption.find(purchase_option_id)    
    user_contents = QueryUserContentService.call(user_id: user.id)

    raise PrevPurchaseIsNotExpired if user_contents.pluck(:id).include?(purchase_option.content.id)

    purchase = Purchase.new(user_id: user_id, expired_at: 2.days.from_now)
    purchase.purchase_items.new(purchase_option_id: purchase_option_id)

    purchase.save && purchase
  end
end

class PrevPurchaseIsNotExpired < StandardError; end;
