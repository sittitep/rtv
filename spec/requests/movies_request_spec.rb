require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET index" do
    it "returns movies ordered by created_at" do
      get "/movies"

      expect(response.status).to eq(200)
    end
  end
end
