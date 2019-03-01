require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given!(:article) { FactoryBot.create(:alice_article, user: user) }

  scenario 'コメントを投稿できること' do
    sign_in_as user
    click_link article.title
    expect {
      fill_in :content, with: "コメントテスト"
      click_on "投稿"
    }.to change(Comment, :count).by(1)
  end
end
