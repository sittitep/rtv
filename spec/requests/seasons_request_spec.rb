require 'rails_helper'

RSpec.describe "Seasons", type: :request do
  describe "GET index" do
    it "returns seasons ordered by created_at" do
      create_list(:season, 3, :with_episodes, episodes_count: 3)

      get "/seasons"

      expect(response.status).to eq(200)
      expect(response.parsed_body["data"].count).to eq(3)

      season = response.parsed_body["data"].first
      season_episodes = season["attributes"]["episodes"]["data"]

      expect(season_episodes.count).to eq(3)
      expect(season_episodes.first["attributes"]["number"]).to eq(1)
      expect(season_episodes.last["attributes"]["number"]).to eq(3)
    end
  end
end
