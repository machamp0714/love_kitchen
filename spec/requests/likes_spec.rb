require 'rails_helper'

RSpec.describe "Likes", type: :request do

  let(:like_params) { FactoryBot.attributes_for(:like) }

  describe 'POST #create' do
    it 'ログインしていないユーザーは「いいね」出来ないこと' do
      post likes_path, params: like_params
      expect(response).to redirect_to login_url
    end
  end
end
