require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "GET /likes" do
    it "works! (now write some real specs)" do
      get likes_index_path
      expect(response).to have_http_status(200)
    end
  end
end
