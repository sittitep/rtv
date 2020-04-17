require 'rails_helper'

RSpec.describe "Seasons", type: :request do
  describe "GET index" do
    it "returns seasons ordered by created_at" do
      create_list(:season, 3)

      get "/seasons"

      expect(response.status).to eq(200)
      expect(response.parsed_body["data"].count).to eq(3)
    end
  end
end
