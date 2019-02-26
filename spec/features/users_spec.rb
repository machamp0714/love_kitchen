require 'rails_helper'

RSpec.feature "Users", type: :feature do
  
  given(:user) { FactoryBot.create(:alice) }
  given(:image_path) { File.join(Rails.root, 'spec/fixtures/love_kitchen.png') }

  scenario '新しいユーザーを作成できること' do
    visit root_path
    click_link "無料会員登録"
    expect {
      fill_in "ユーザー名", with: "alice"
      fill_in "メールアドレス", with: "alice@email.com"
      fill_in "パスワード", with: "password"
      fill_in "確認用パスワード", with: "password"
      click_on "登録する"
    }.to change(User, :count).by(1)  
    expect(page).to have_content "アカウント登録が完了しました。"
  end

  scenario 'プロフィールを編集出来ること' do
    sign_in_as user
    go_to_profile
    fill_in "自己紹介", with: "hello, my name is alice."
    click_on "更新する"
    expect(page).to have_content "アカウント情報を変更しました。"
  end

  scenario 'パスワードを変更できること' do
    sign_in_as user
    go_to_profile
    click_link "パスワード"
    fill_in "パスワード", with: "hogehoge"
    fill_in "確認用パスワード", with: "hogehoge"
    click_on "変更する"
    expect(page).to have_content "パスワードが変更されました。"
  end

  scenario 'アカウントを削除できること' do
    sign_in_as user
    go_to_profile
    expect {
      click_link "アカウントを削除する"
    }.to change(User, :count).by(-1)
    expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
  end

  scenario 'アカウントを削除すると、紐づけられている記事も削除されること' do
    alice = FactoryBot.create(:alice) do |u|
      u.articles.create(FactoryBot.attributes_for(:alice_article))
    end
    sign_in_as alice
    go_to_profile
    expect {
      click_link "アカウントを削除する"
    }.to change(Article, :count).by(-1)
  end

  scenario 'アバター画像をアップロードできること' do
    sign_in_as user
    go_to_profile
    attach_file "user[avatar]", image_path
    click_on "更新する"
    expect(page.find('#profile-avatar')['src']).to have_content 'love_kitchen.png'
  end

  def go_to_profile
    click_link "プロフィール"
    click_link "プロフィールを編集する"
  end
end