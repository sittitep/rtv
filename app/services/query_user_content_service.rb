# frozen_string_literal: true

class QueryUserContentService
  def self.call(args)
    new.call(args)
  end

  def call(user_id:)
    Content
      .joins(purchase_options: { purchase_items: :purchase })
      .where(purchases: { user_id: user_id })
      .where('purchases.expired_at > ?', Time.zone.now)
      .order('purchases.expired_at ASC')
      .select('contents.*, purchases.expired_at AS purchase_expired_at')
  end
end
