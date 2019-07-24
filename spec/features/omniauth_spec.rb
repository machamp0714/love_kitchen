require 'rails_helper'

RSpec.feature "Omniauths", type: :feature do
  background do
    Rails.application.env_config['omniauth.auth'] = twitter_mock
  end

  # it 'twitterでサインアップできること' do
  #   visit signup_path
  #   expect {
  #     find('.twitter-link').click
  #   }.to change { User.count }.by(1)
  #   expect(page).to have_content 'ログインしました。'
  # end

  it 'twitterで認証に失敗した場合、登録画面にリダイレクトすること' do
    Rails.application.env_config['omniauth.auth'].info.nickname = nil
    visit signup_path
    find('.twitter-link').click
    expect(current_path).to eq signup_path
    expect(page).to have_content 'ユーザー認証に失敗しました。'
  end
end
