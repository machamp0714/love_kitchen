# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Picture", type: :request do
  let(:user) { FactoryBot.create(:alice) }
  let(:other_user) { FactoryBot.create(:bob) }
  let(:article) { FactoryBot.create(:alice_article, user: user) }
  let(:picture) { article.pictures.first }

  describe "DELETE #destroy" do
    it "他のユーザーの記事に添付されている写真を削除できないこと" do
      sign_in other_user
      delete picture_path(picture)
      expect(response).to redirect_to root_url
    end
  end
end
