require 'rails_helper'

RSpec.feature "Users", type: :feature do
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
  end
end
