# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Favorites", type: :request do

  describe "POST #create" do
    before do
      @user = FactoryBot.create(:alice)
      @article = FactoryBot.create(:bob_article, user: FactoryBot.create(:bob))
      @favorite_params = FactoryBot.attributes_for(:favorite, user: @user, article: @article)
    end
    it "ログインしていない場合、お気に入りに記事を追加できないこと" do
      post user_favorites_path(@user, @user.favorites.build), params: @favorite_params
      expect(response).to redirect_to login_url
    end
  end
end
