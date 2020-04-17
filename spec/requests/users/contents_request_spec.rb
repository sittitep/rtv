# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Contents', type: :request do
  describe 'GET index' do
    it "return user's content" do
      user = create(:user)
      create_list(:purchase, 2, :with_purchase_items, purchase_items_count: 1, user: user)

      get '/users/contents', params: { user_id: user.id }

      expect(response.status).to eq(200)
      expect(response.parsed_body['data'].count).to eq(2)
    end
  end
end
