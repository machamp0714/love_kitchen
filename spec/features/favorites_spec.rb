require 'rails_helper'

RSpec.feature "Favorites", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given(:other_user) { FactoryBot.create(:bob) }
  given!(:article) { FactoryBot.create(:bob_article, user: other_user) }

  feature 'まだお気に入りしていない場合' do
    scenario 'お気に入りに記事を追加できること' do
      sign_in_as user
      click_link article.title
      expect {
        find('.favorite').click
      }.to change(Favorite, :count).by(1)
      expect(page).to have_css '.unfavorite'
    end
  end
end
