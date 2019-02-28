require 'rails_helper'

RSpec.feature "Comments", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given(:other_user) { FactoryBot.create(:bob) }
  
  before do
    @article = FactoryBot.create(:bob_article, user: other_user)
  end

  scenario 'コメントを投稿できること' do
    sign_in_as user
    click_link @article.title
    expect {
      fill_in :content, with: "コメントテスト"
      click_on "投稿"
    }.to change(Comment, :count).by(1)
  end
end
