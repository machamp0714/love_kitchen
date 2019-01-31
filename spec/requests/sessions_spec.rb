require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  let(:user) { FactoryBot.create(:alice) }

  describe 'POST #create' do
    it "ログインするとトップページにリダイレクトすること" do
      sign_in user
      delete logout_path
      expect(response).to redirect_to root_url
    end
  end
end
