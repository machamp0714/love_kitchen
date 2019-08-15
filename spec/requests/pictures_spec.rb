# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Picture", type: :request do
  let(:user) { FactoryBot.create(:alice) }
  let(:other_user) { FactoryBot.create(:bob) }
  let(:article) { FactoryBot.create(:alice_article, user: user) }
  let(:picture) { article.pictures.first }
  let(:image_path) { Rails.root.join("spec", "fixtures", "love_kitchen.png") }

  describe "POST #create" do
    it "他のユーザーの記事に写真を追加出来ないこと" do
      sign_in other_user
      post pictures_path, params: {
        image: image_path,
        picture: {
          article_id: article.id
        }
      }
      expect(response).to redirect_to root_url
    end
  end

  describe "DELETE #destroy" do
    it "他のユーザーの記事に添付されている写真を削除できないこと" do
      sign_in other_user
      delete picture_path(picture)
      expect(response).to redirect_to root_url
    end
  end
end
