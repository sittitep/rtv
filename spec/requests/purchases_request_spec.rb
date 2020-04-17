require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  describe "POST create" do
    it "returns a purchase" do
      user = create(:user)
      purchase_option = create(:purchase_option)
      
      post "/purchases", params: {user_id: user.id, purchase_option_id: purchase_option.id}

      expect(response.status).to eq(200)
    end
  end
end
