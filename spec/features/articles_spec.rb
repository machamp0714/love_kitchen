# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Articles", type: :feature do

  given(:user) { FactoryBot.create(:alice) }
  given(:image_path) { Rails.root.join("spec", "fixtures", "love_kitchen.png") }
  given!(:article) { FactoryBot.create(:alice_article, user: user) }
  given!(:other_article) { FactoryBot.create(:bob_article) }

  scenario "記事を投稿できること" do
    sign_in_as user
    click_link "投稿する"
    expect {
      fill_in "article[title]", with: "アルミパン"
      fill_in "article[content]", with: "アルミパンはコスパがいい"
      fill_in "article[label1]", with: "label1"
      fill_in "article[label2]", with: "label2"
      fill_in "article[label3]", with: "label3"
      select "1", from: "article[data1]"
      select "2", from: "article[data2]"
      select "3", from: "article[data3]"
      within ".editorSubmit" do
        click_on "投稿する"
      end
    }.to change(Article, :count).by(1)
    expect(page).to have_content "Success!!"
  end

  scenario "写真も同時に投稿できること" do
    sign_in_as user
    click_link "投稿する"
    expect {
      fill_in "article[title]", with: "アルミパン"
      fill_in "article[content]", with: "アルミパンはコスパがいい"
      fill_in "article[label1]", with: "label1"
      fill_in "article[label2]", with: "label2"
      fill_in "article[label3]", with: "label3"
      select "1", from: "article[data1]"
      select "2", from: "article[data2]"
      select "3", from: "article[data3]"
      attach_file "article[pictures_attributes][0][image]", image_path
      within ".editorSubmit" do
        click_on "投稿する"
      end
    }.to change(Picture, :count).by(1)
    expect(page).to have_content "Success!!"
  end

  scenario "タイトルを更新できること" do
    sign_in_as user
    click_link article.title
    click_link "編集する"
    fill_in "article[title]", with: "タイトル更新"
    click_on "更新する"
    expect(page).to have_content "更新しました。"
  end

  scenario "投稿内容を更新できること" do
    sign_in_as user
    click_link article.title
    click_link "編集する"
    click_link "投稿内容"
    fill_in "article[content]", with: "投稿内容更新"
    click_on "更新する"
    expect(page).to have_content "更新しました。"
  end

  scenario "記事を削除できること" do
    sign_in_as user
    click_link "プロフィール"
    within "#posted-articles" do
      click_link article.title
    end
    expect {
      click_link "削除する"
    }.to change(Article, :count).by(-1)
    expect(page).to have_content "Deleted!!"
  end

  scenario "記事を検索できること(title検索)" do
    sign_in_as user
    fill_in "q[title_or_content_cont]", with: "中華鍋"
    find(".search-box").click
    expect(page).to have_content article.title
    expect(page).to_not have_content other_article.title
  end

  scenario "記事を検索できること(content検索)" do
    sign_in_as user
    fill_in "q[title_or_content_cont]", with: "熱伝導"
    find(".search-box").click
    expect(page).to have_content article.title
    expect(page).to_not have_content other_article.title
  end
end
