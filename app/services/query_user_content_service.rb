class QueryUserContentService
  def self.call(args)
    new.call(args)
  end

  def call(user_id:)
    Content
      .joins(purchase_options: {purchase_items: :purchase})
      .where(purchases: {user_id: user_id})
      .select("*, purchases.expired_at AS purchase_expired_at")
      .order("purchases.expired_at ASC")
  end
end
