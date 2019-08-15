# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Articles", type: :request do

  let(:alice) { FactoryBot.create(:alice) }
  let(:bob) { FactoryBot.create(:bob) }
  before do
    @bob_article = FactoryBot.create(:bob_article, user: bob)
  end

  describe "GET #new" do
    it "ログインしていない場合ログインページにリダイレクトされること" do
      get new_article_path
      expect(response).to redirect_to login_url
    end
  end

  describe "DELETE #destroy" do
    it "他のユーザーの記事を削除できないこと" do
      sign_in alice
      delete article_path(@bob_article)
      expect(response).to redirect_to root_url
    end
  end
end
