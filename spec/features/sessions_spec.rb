# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Sessions", type: :feature do

  before do
    FactoryBot.create(:alice)
  end

  scenario "ログイン出来ること" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: "alice@email.com"
    fill_in "パスワード", with: "password"
    click_button "ログイン"
    expect(page).to have_content "ログインしました"
  end

  scenario "ログアウトできること" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: "alice@email.com"
    fill_in "パスワード", with: "password"
    click_button "ログイン"
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました"
  end
end
