require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:bob) }

  describe 'GET #new' do
    it "ログインしている時、トップページにリダイレクトすること" do
      sign_in user
      get signup_path
      expect(response).to redirect_to root_url
    end
  end
end
