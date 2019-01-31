require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  scenario 'ログイン出来ること' do
    visit root_path
    click_link 'ログイン'
    fill_in 'メールアドレス', with: 'alice@email.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
    expect(page).to have_content 'ログアウト'
  end
end
