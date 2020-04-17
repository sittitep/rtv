require 'rails_helper'

RSpec.describe "CreatePurchaseService" do
  describe "call" do
    it "returns a saved purchase" do
      user = create(:user)
      purchase_option = create(:purchase_option)

      purchase = CreatePurchaseService.call(user_id: user.id, purchase_option_id: purchase_option.id)

      expect(purchase).to be_persisted    
      expect(purchase.user_id).to eq(user.id)  
      expect(purchase.purchase_items.first.purchase_option).to eq(purchase_option)  
    end
  end
end
