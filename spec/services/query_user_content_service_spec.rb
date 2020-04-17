require 'rails_helper'

RSpec.describe "QueryUserContentService" do
  describe "call" do
    it "returns user's contents" do
      user_1 = create(:user)
      user_2 = create(:user)

      purchase_1 = create(:purchase, :with_purchase_items, purchase_items_count: 1, user: user_1)
      purchase_2 = create(:purchase, :with_purchase_items, purchase_items_count: 1, user: user_2)
      purchase_3 = create(:purchase, :with_purchase_items, purchase_items_count: 1, user: user_1)

      contents = QueryUserContentService.call(user_id: user_1.id)
      expect(contents.size).to eq(2)

      contents = QueryUserContentService.call(user_id: user_2.id)
      expect(contents.size).to eq(1)
    end
  end
end
