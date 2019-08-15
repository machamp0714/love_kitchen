# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Notifications", type: :feature do
  given(:user) { FactoryBot.create(:alice) }
  given(:other_user) { FactoryBot.create(:bob) }
  given!(:article) { FactoryBot.create(:bob_article, user: other_user) }

  scenario "ユーザーの記事がいいねされた時、通知が来ること" do
    sign_in_as user
    click_link article.title
    expect {
      find(".likable").click
    }.to change(Notification, :count).by(1)
    click_link "ログアウト"

    sign_in_as other_user

    within("#notificationDropdown") do
      expect(page).to have_content 1
    end
    expect(page).to have_content "#{user.name} があなたの記事 「#{article.title}」 を いいね しました。"

    click_link "既読にする"

    within("#notificationDropdown") do
      expect(page).to have_content 0
    end
  end

  scenario "記事にコメントが付いた時、通知が来ること" do
    sign_in_as user
    click_link article.title
    expect {
      fill_in "comment[content]", with: "コメント"
      click_on "投稿"
    }.to change(Notification, :count).by(1)
    click_link "ログアウト"

    sign_in_as other_user

    within("#notificationDropdown") do
      expect(page).to have_content 1
    end
    expect(page).to have_content "#{user.name} があなたの記事 「#{article.title}」 に コメント しました。"
  end

  scenario "記事がお気に入りに追加された時、通知が来ること" do
    sign_in_as user
    click_link article.title
    expect {
      find(".favorite").click
    }.to change(Notification, :count).by(1)
    click_link "ログアウト"

    sign_in_as other_user

    within("#notificationDropdown") do
      expect(page).to have_content 1
    end
    expect(page).to have_content "#{user.name} があなたの記事 「#{article.title}」 を お気に入り に追加しました。"
  end

  scenario "記事が削除された時、通知も削除されること" do
    sign_in_as other_user
    click_link article.title
    fill_in "comment[content]", with: "コメント"
    click_on "投稿"
    expect {
      click_link "削除する"
    }.to change(Notification, :count).by(-1)
  end
end
