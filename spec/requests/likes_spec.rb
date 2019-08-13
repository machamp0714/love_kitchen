# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Likes", type: :request do

  describe "POST #create" do
    before do
      @user = FactoryBot.create(:alice)
      @article = FactoryBot.create(:alice_article, user: @user)
      @like_params = FactoryBot.attributes_for(:like)
    end
    it "ログインしていないユーザーは「いいね」出来ないこと" do
      post article_likes_path(@article, @user.likes.build), params: @like_params
      expect(response).to redirect_to login_url
    end
  end
end
