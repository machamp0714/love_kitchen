require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given!(:article) { FactoryBot.create(:alice_article, user: user) }
  given!(:comment) { FactoryBot.create(:alice_comment, user: user, article: article) }

  scenario 'コメントを投稿できること' do
    sign_in_as user
    within '#posted-order' do
      click_link article.title
    end
    expect {
      within '#comment-post' do
        fill_in 'comment[content]', with: "コメントテスト"
      end
      click_on "投稿"
    }.to change(Comment, :count).by(1)
  end

  scenario 'コメントを削除できること' do
    sign_in_as user
    within '#posted-order' do
      click_link article.title
    end
    expect {
      click_link '削除'
    }.to change(Comment, :count).by(-1)
  end
end
