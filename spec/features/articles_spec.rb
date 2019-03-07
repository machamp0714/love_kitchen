require 'rails_helper'

RSpec.feature "Articles", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given!(:article) { FactoryBot.create(:alice_article, user: user) }

  scenario '記事を投稿できること' do
    sign_in_as user
    click_link "投稿する"
    expect {
      fill_in "article[title]", with: "アルミパン"
      fill_in "article[content]", with: "アルミパンはコスパがいい"
      fill_in "article[label1]", with: "label1"
      fill_in "article[label2]", with: "label2"
      fill_in "article[label3]", with: "label3"
      fill_in "article[data1]", with: 1
      fill_in "article[data2]", with: 2
      fill_in "article[data3]", with: 3
      within '.editorSubmit' do
        click_on "投稿する"
      end
    }.to change(Article, :count).by(1)
    expect(page).to have_content "Success!!"
  end

  scenario '記事を編集できること' do
    sign_in_as user
    click_link "プロフィール"
    click_link article.title
    click_link "編集する"
    fill_in "article[title]", with: "編集テスト"
    fill_in "article[content]", with: "テスト投稿"
    click_on "更新する"
    expect(page).to have_content "Updated!!"
  end

  scenario '記事を削除できること' do
    sign_in_as user
    click_link "プロフィール"
    click_link article.title
    expect {
      click_link "削除する"
    }.to change(Article, :count).by(-1)
    expect(page).to have_content "Deleted!!"
  end
end
