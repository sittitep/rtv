require 'rails_helper'

RSpec.describe "Contents", type: :request do
  describe "GET index" do
    it "return contents" do
      create(:movie)
      create(:season)

      get "/contents"

      expect(response.status).to eq(200)

      expect(response.parsed_body["data"].count).to eq(2)
      expect(response.parsed_body["data"][0]["attributes"]["resource_type"]).to eq("Movie")
      expect(response.parsed_body["data"][1]["attributes"]["resource_type"]).to eq("Season")
    end
  end
end
