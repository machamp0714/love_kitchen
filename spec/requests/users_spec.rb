# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:bob) }

  describe "GET #new" do
    it "ログインしている時、トップページにリダイレクトすること" do
      sign_in user
      get signup_path
      expect(response).to redirect_to root_url
    end
  end

  describe "GET #edit" do
    it "ログインしていない場合、ログインページにリダイレクトすること" do
      get setting_profile_path
      expect(response).to redirect_to login_url
    end
  end

  describe "PATCH #update" do
    it "ログインしていない場合、401エラーが出ること" do
      patch setting_profile_path(user), params: {
        user: { name: "alice" }
      }
      expect(response.status).to eq 401
    end
  end
end
