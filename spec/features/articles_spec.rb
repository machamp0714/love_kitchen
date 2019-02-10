require 'rails_helper'

RSpec.feature "Articles", type: :feature do

  given(:alice) { FactoryBot.create(:alice) }
  before do
    @article = FactoryBot.create(:test, user: alice)
  end

  scenario '記事を投稿できること' do
    sign_in_as alice
    click_link "投稿する"
    expect {
      fill_in "タイトル", with: "アルミパン"
      fill_in "article[content]", with: "アルミパンはコスパがいい"
      click_on "LoveKitchenに投稿"
    }.to change(Article, :count).by(1)
    expect(page).to have_content "Success!!"
  end

  scenario '記事を編集できること' do
    sign_in_as alice
    click_link "プロフィール"
    click_link @article.title
    click_link "編集する"
    fill_in "article[title]", with: "編集テスト"
    fill_in "article[content", with: "テスト投稿"
    click_on "編集する"
    expect(page).to have_content "Updated!!"
  end
end
