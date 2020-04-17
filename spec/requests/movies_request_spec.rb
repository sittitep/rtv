require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET index" do
    it "returns movies ordered by created_at" do
      create_list(:movie, 3)

      get "/movies"

      expect(response.status).to eq(200)
      expect(response.parsed_body["data"].count).to eq(3)
    end
  end
end
