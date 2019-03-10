require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  describe 'POST #create' do
    it "works! (now write some real specs)" do
      get favorites_index_path
      expect(response).to have_http_status(200)
    end
  end
end
