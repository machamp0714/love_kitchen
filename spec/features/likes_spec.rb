require 'rails_helper'

RSpec.feature "Likes", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given(:other_user) { FactoryBot.create(:bob) }
  given!(:alice_article) { FactoryBot.create(:alice_article, user: user) }
  given!(:bob_article) { FactoryBot.create(:bob_article, user: other_user) }
  
  feature 'まだ「いいね」していない場合' do
    scenario '「いいね」できること' do
      sign_in_as other_user
      click_link alice_article.title
      expect {
        find('.likable').click
      }.to change(Like, :count).by(1)
      expect(page).to have_css '.liked'
    end
  end

  feature '「いいね」済みの場合' do
    background do
      FactoryBot.create(:like, user: user, article: bob_article)
    end
    scenario '「いいね」解除できること' do
      sign_in_as user
      click_link bob_article.title
      expect {
        find('.liked').click
      }.to change(Like, :count).by(-1)
      expect(page).to have_css '.likable'
    end
  end
end
