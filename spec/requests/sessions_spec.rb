require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sessions" do
    it "works! (now write some real specs)" do
      get sessions_index_path
      expect(response).to have_http_status(200)
    end
  end
end
